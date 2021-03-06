require 'nokogiri'
require 'open-uri'

module AllThingsUmphreys
  class UpdateCurrentYearSetlists
    include Sidekiq::Worker
    include Sidetiq::Schedulable

    recurrence { daily.hour_of_day(10) }

    def initialize
      @url = "http://allthings.umphreys.com/setlists/2015.html"
      @doc = Nokogiri::HTML(open(@url))
    end

    def perform
      @doc.css(".setlist").each do |show|
        show_info = get_show_info(show)
        current_show = create_or_update_show(show_info)
        populate_setlist_info(current_show)
      end
    end

    def get_show_info(show)
      songs_played = show.css("> p a").map do |song|
        song.text
      end

      show_object = {
        :date_of_show => Date.strptime(show.at_css(".setlistdate").text, '%m.%d.%Y'),
        :show_venue => show.at_css(".venue").text,
        :show_city => show.at_css("a:nth-child(3)").text,
        :show_state => show.at_css("a:nth-child(4)").text,
        :show_country => show.at_css("a:nth-child(5)").text,
        :songs_played => songs_played.uniq! || songs_played,
        :atu_link => "allthings.umphreys.com#{show.at_css(".setlistdate").attributes["href"].value}",
        :is_graded => false,
        :has_happened => true
      }
      show_object
    end

    def create_or_update_show(show_info)
      shows = Show.where(
        :date_of_show => show_info[:date_of_show], 
        :show_venue => show_info[:show_venue]
      )
      if shows.count <= 1
        shows.first_or_create.update!(show_info)
        Show.find_by_date_of_show_and_show_venue(show_info[:date_of_show], show_info[:show_venue])
      else
        current_show = shows.where("songs_played[1] = ?", show_info[:shows_played][0]).update!(song_info)
      end
    end

    def populate_setlist_info(current_show)
      current_show[:songs_played].each_with_index do |song, index|
        opener_flag = index == 0 ? true : false
        current_show.song_shows.where(song_id: Song.find_by(song_name: song).id).first_or_create.update!(song_id: Song.find_by(song_name: song).id, is_opener: opener_flag)
      end
    end
  end
end
