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
      # Loop through each row in table, getting information
      @doc.css(".setlist").each do |show|
        show_info = get_show_info(show)
      end
    end

    def get_show_info(show)
      show_object = {
        :date_of_show => Date.strptime(show.at_css(".setlistdate").text, '%m.%d.%Y'),
        :show_venue => show.at_css(".venue").text,
        :show_city => show.at_css("a:nth-child(3)").text,
        :show_state => show.at_css("a:nth-child(4)").text,
        :show_country => show.at_css("a:nth-child(5)").text,
        :songs_played => show.css("> p a").map do |song|
      }
    end

    def populate_setlist_info
    end

  end
end







    #     song_info = get_song_info(song)
    #     Song.where(:song_name => song_info[:song_name]).first_or_create.update(song_info)
    #   end
    # end

    # def get_song_info(song)
    #   song_object = {
    #     :song_name => get_full_song_name(song.at_css("td:nth-child(1) a").text),
    #     :song_artist => song.at_css("td:nth-child(2)").text,
    #     :times_played => song.at_css("td:nth-child(3)").text,
    #     :debut_date => song.at_css("td:nth-child(4) a").text,
    #     :last_played_date => song.at_css("td:nth-child(5) a").text
    #   }
    #   song_object
    # end

    # def get_full_song_name(song_name)
    #   if song_name[-3..-1] == "..."
    #     @agent = Mechanize.new
    #     actual_song_name = @agent.get(@url).links_with(:text => song_name)[0].click.search(".splashtitle").text.gsub("Songs > ", "")
    #     actual_song_name
    #   else
    #     song_name
    #   end
    # end
  end
end



