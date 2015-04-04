require 'nokogiri'
require 'open-uri'

module AllThingsUmphreys
  class UpdateUpcomingShows
    include Sidekiq::Worker
    include Sidetiq::Schedulable

    recurrence { daily.hour_of_day(10) }

    def initialize
      @url = "http://umphreys.com/tour/"
      @doc = Nokogiri::HTML(open(@url))
    end

    def perform
      @doc.css(".clearfix").each do |show|
        if !show.at_css(".nonUmphs").nil?
          show_info = get_show_info(show)
          create_or_update_show(show_info)
        end
      end
    end

    def get_show_info(show)
      city_state = show.at_css(".where > h3").text
      time = show.at_css(".time > h2")
      show_object = {
        :date_of_show => DateTime.parse(show.at_css(".when > h2").text),
        :show_venue => show.at_css(".where > h2 > a").text,
        :show_city => city_state[0...(city_state.length - 4)],
        :show_state => city_state[(city_state.length - 2)...city_state.length],
        :time_of_show => time.nil? ? nil : Time.parse(time.text),
        :atu_link => @url,
        :is_graded => false,
        :has_happened => false
      }
      show_object
    end

    def create_or_update_show(show_info)
      shows = Show.where(
        :date_of_show => show_info[:date_of_show], 
        :show_venue => show_info[:show_venue],
        :show_city => show_info[:show_city],
        :show_state => show_info[:show_state]
      )
      if shows.count <= 1
        shows.first_or_create.update!(show_info)
        Show.find_by_date_of_show_and_show_venue(show_info[:date_of_show], show_info[:show_venue])
      else
        # TBD
      end
    end
  end
end
