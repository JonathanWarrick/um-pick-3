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

		# Save to database!
		Song.create(song_name: song_name, 
			          song_artist: song_artist, 
			          times_played: times_played,
			          debut_date: debut_date,
			          last_played_date: last_played_date)
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
		date_of_show = Date.strptime(show.at_css(".setlistdate").text, '%m.%d.%Y')
		puts date_of_show
		show_venue = show.at_css(".venue").text
		show_city = show.at_css("a:nth-child(3)").text
		show_state = show.at_css("a:nth-child(4)").text
		show_country = show.at_css("a:nth-child(5)").text
		songs_played = show.css("> p a").map do |song|
			song.text
		end
		
		# Save to database!
		Show.create(date_of_show: date_of_show,
			          show_venue: show_venue,
			          show_city: show_city,
			          show_state: show_state,
			          show_country: show_country,
			          songs_played: songs_played)
	end
end