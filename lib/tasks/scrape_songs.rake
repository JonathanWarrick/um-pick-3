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

task :scrape_past_shows => :environment do
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

		songs_played.uniq! unless songs_played.length === songs_played.uniq.length
		
		# Save to database!
		Show.create(date_of_show: date_of_show,
			          show_venue: show_venue,
			          show_city: show_city,
			          show_state: show_state,
			          show_country: show_country,
			          songs_played: songs_played)

		# Save to Show/Song join table!
		# THIS WILL CAUSE ISSUES WITH TWO SHOWS ON A DATE (NEED TIME)
		current_show = Show.find_by(date_of_show: date_of_show)
		songs_played.each do |song|
			puts "1 #{song}"
			if song.length < 35
			  current_show.song_shows.create(song_id: Song.find_by(song_name: song).id)
			else
				altered_song = song[0...30]
				puts "2 #{altered_song}"
				current_show.song_shows.create(song_id: Song.find_by("song_name LIKE ?", "%#{altered_song}%").id)
			end
		end
	end
end

task :scrape_upcoming_shows => :environment do
	require 'nokogiri'
	require 'open-uri'

	# Link to setlits page
	url = "http://umphreys.com/tour/"
	doc = Nokogiri::HTML(open(url))

	# Loop through each upcoming show, getting information
	doc.css(".clearfix").each do |show|
		# Need to account for:
		  # No time (CHECK!)
		  # Multiple Dates
		  # Multiple Shows on a Date
		  # Non-UM (CHECK!)
		  # Non-US (WAIT AND SEE)
		if show.at_css(".nonUmphs").nil?
			date_of_show = DateTime.parse(show.at_css(".when > h2").text)
			show_venue = show.at_css(".where > h2 > a").text
			city_state = show.at_css(".where > h3").text
			show_city = city_state[0...(city_state.length - 4)]
			show_state = city_state[(city_state.length - 2)...city_state.length]
			time = show.at_css(".time > h2")
			time_of_show = time.nil? ? nil : Time.parse(time.text)
			# time_of_show = !nil? show.at_css(".time > h2") ? Time.parse(show.at_css(".time > h2").text) : nil

			# puts "On #{date_of_show} at #{time_of_show} in #{show_city}, #{show_state} at #{show_venue}."
			if !Show.find_by_date_of_show_and_show_venue_and_show_city_and_show_state(date_of_show, show_venue, show_city, show_state)
				puts "Show on #{date_of_show} in #{show_city} created!"
				Show.create(date_of_show: date_of_show,
     			          show_venue: show_venue,
		    	          show_city: show_city,
			              show_state: show_state,
			              time_of_show: time_of_show)
			else
				puts 'Show already exists'
			end
		end
	end
end

task :score_shows => :environment do
	binding.pry
	# Find all shows that have happened, but have not yet been graded
	# Should only be one per day when this is all up and running
	Show.where(:is_graded => false, :has_happened => true).each do |show|
		# Find all submissions for the given show
		show.submissions.each do |submission|
			
			total_score = 0
			originals_correct = 0
			covers_correct = 0
			opener_correct = false
			
			# Loop through each guess for each submission
			submission.guesses.each do |guess|
				# Check if song was played
				current_guess_song = show.song_shows.find_by_song_id(guess.song_id)
				if !current_guess_song.nil?
					guess.update_attribute(:is_correct, true)
					# Check if guess was original
					if !guess.is_cover
						originals_correct += 1
					end
					
					# Check if guess was opener
					if current_guess_song.is_opener && guess.is_opener
						opener_correct = true
					end

					# Check if guess was cover
					if guess.is_cover
						covers_correct += 1
					end
				end
			end

			total_score += (originals_correct * 3) + 
			         (covers_correct * 5) + 
			         (opener_correct ? 2 : 0) +
			         (originals_correct === 3 ? 5 : 0) +
			         (originals_correct === 3 && covers_correct === 1 ? 5 : 0)

			submission.update_attributes(:is_graded => true, :submission_score => total_score)
		end
		show.update_attribute(:is_graded, true)
	end 
end

task :scrape_all_shows => :environment do
	require 'nokogiri'
	require 'open-uri'

	# Link to setlits page
	(1998..2015).to_a.each do |year|
		url = "http://allthings.umphreys.com/setlists/#{year}.html"
		doc = Nokogiri::HTML(open(url))
		song_root_url = "http://allthings.umphreys.com/song"

		# Loop through each row in table, getting information
		doc.css(".setlist").each do |show|
			date_of_show = Date.strptime(show.at_css(".setlistdate").text, '%m.%d.%Y')
			# puts date_of_show
			# puts show.css("> p a")[0].text
			# if date_of_show = "2013-02-17"
			# 	binding.pry
			# end
			if ![Date.new(2006,05,21), Date.new(2009,02,21), Date.new(1998,12,17), Date.new(1998,12,18), Date.new(1999,02,18), Date.new(1999,02,25), Date.new(1999,02,26), Date.new(2001,9,22), Date.new(2001,12,11), Date.new(2002,10,8)].include? date_of_show
				if date_of_show == Date.new(2003,3,17)
					puts "Date: 2003-03-17, First Song: When the World Is Running Down You Make the Best of What's Still Around, Arist: The Police"
				else
					first_song_played = show.css("> p a")[0].text
					# # puts first_song_played


					song_info = Song.find_by_song_name(first_song_played)
					if song_info[:song_artist] != "Umphrey's McGee" && song_info[:song_artist] != "Ali Baba's Tahini" && song_info[:song_artist] != "Karl Engelmann"
						puts "Date: #{date_of_show}, First Song: #{song_info[:song_name]}, Artist: #{song_info[:song_artist]}"
					end
				end
			end
			# if !song_info
			# 	puts 'HELP ME'
			# else
			# 	if !["Umphrey's McGee", "Ali Baba's Tahini"].include? song_info[:song_artist]
			# 		puts date_of_show
			# 	end
			# end
		end
	end
end