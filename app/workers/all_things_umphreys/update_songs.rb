require 'nokogiri'
require 'open-uri'
require 'mechanize'

module AllThingsUmphreys
  class UpdateSongs
    include Sidekiq::Worker
    include Sidetiq::Schedulable

    recurrence { hourly(4) }

    def initialize
      # Link to songs page
      @url = "http://allthings.umphreys.com/song/"
      @doc = Nokogiri::HTML(open(@url))
    end

    def perform
      # Loop through each row in table, getting information
      @doc.css("#songtable tbody tr").each do |song|
        song_info = get_song_info(song)
        Song.where(:song_name => song_info[:song_name]).first_or_create.update(song_info)
      end
    end

    def get_song_info(song)
      song_object = {
        :song_name => get_full_song_name(song.at_css("td:nth-child(1) a").text),
        :song_artist => song.at_css("td:nth-child(2)").text,
        :times_played => song.at_css("td:nth-child(3)").text,
        :debut_date => song.at_css("td:nth-child(4) a").text,
        :last_played_date => song.at_css("td:nth-child(5) a").text
      }
      song_object
    end

    def get_full_song_name(song_name)
      if song_name[-3..-1] == "..."
        @agent = Mechanize.new
        actual_song_name = @agent.get(@url).links_with(:text => song_name)[0].click.search(".splashtitle").text.gsub("Songs > ", "")
        actual_song_name
      else
        song_name
      end
    end
  end
end



