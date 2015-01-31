task :scrape_songs => :environment do
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
		# Song.create(song_name: song_name)
	end
end

task :scrape_shows => :environment do
	require 'nokogiri'
	require 'open-uri'

	# Link to setlits page
	url = "http://allthings.umphreys.com/setlists/2015.html"
	doc = Nokogiri::HTML(open(url))
	song_root_url = "http://allthings.umphreys.com/song"

	# Loop through each row in table, getting information
	doc.css(".setlist").each do |show|
		date_of_show = show.at_css(".setlistdate").text
		show_venue = show.at_css(".venue").text
		show_city = show.at_css("a:nth-child(3)").text
		show_state = show.at_css("a:nth-child(4)").text
		show_country = show.at_css("a:nth-child(5)").text
		songs = show.css("> p a").map do |song|
			song.text
		end
		puts "On #{date_of_show} at #{show_venue} these songs were played #{songs}"
		puts "BREAK"
	end
end