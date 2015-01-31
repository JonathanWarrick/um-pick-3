require 'rubygems'
require 'nokogiri'
require 'open-uri'

# Link to songs page
url = "http://allthings.umphreys.com/song/"
doc = Nokogiri::HTML(open(url))

# Loop through each row in table, getting information
doc.css("#songtable tbody tr").each do |song|
	song_name = song.at_css("td:nth-child(1) a").text
	song_artist = song.at_css("td:nth-child(2)").text
	times_played = song.at_css("td:nth-child(3)").text
	debut_date = song.at_css("td:nth-child(4) a").text
	last_played_date = song.at_css("td:nth-child(5) a").text

	puts "The song #{song_name} by #{song_artist} has been played #{times_played} times, first on #{debut_date}, and most recently on #{last_played_date}."
end
