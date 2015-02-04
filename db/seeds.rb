# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Populate Songs List
# Song.create(song_name: 'Resolution')
# Song.create(song_name: 'Believe The Lie')
# Song.create(song_name: 'Anchor Drops')
# Song.create(song_name: 'Hurt Bird Bath')
# Song.create(song_name: "Miss Tinkle's Overture")
# Song.create(song_name: "Mulche's Odyssey")
# Song.create(song_name: "1348")
# Song.create(song_name: "#5")
# Song.create(song_name: "In The Kitchen")
# Song.create(song_name: "Domino Theory")

# # Populate Users List
# User.create(name: 'Jonathan Warrick', email: 'Jonathan@Test.com')
# User.create(name: 'Danny Warrick', email: 'Danny@Test.com')
# User.create(name: 'Jim Warrick', email: 'Jim@Test.com')
# User.create(name: 'Carole Warrick', email: 'Carole@Test.com')

# # Populate Shows List
# Show.create(date_of_show: Time.zone.now - 1.day, location_of_show: "New York, NY")
# Show.create(date_of_show: Time.zone.now - 4.day, location_of_show: "Baltimore, MD")
# Show.create(date_of_show: Time.zone.now - 1.month, location_of_show: "Los Angeles, CA")

# # Populate Song_Shows List
# Show.first.song_shows.create(song_id: Song.find_by(song_name: 'Resolution').id)
# Show.first.song_shows.create(song_id: Song.find_by(song_name: 'Hurt Bird Bath').id)
# Show.first.song_shows.create(song_id: Song.find_by(song_name: 'In The Kitchen').id)
# Show.first.song_shows.create(song_id: Song.find_by(song_name: '#5').id)

# # # Populate Submissions List
# User.first.submissions.create
# User.last.submissions.create

# # # Populate Guesses List
# Submission.first.guesses.create(song_id: Song.find_by(song_name: 'Hurt Bird Bath').id)
# Submission.first.guesses.create(song_id: Song.find_by(song_name: 'Believe the Lie').id)
# Submission.first.guesses.create(song_id: Song.find_by(song_name: 'Anchor Drops').id)

# Submission.last.guesses.create(song_id: Song.find_by(song_name: 'Resolution').id)
# Submission.last.guesses.create(song_id: Song.find_by(song_name: 'In The Kitchen').id)
# Submission.last.guesses.create(song_id: Song.find_by(song_name: '1348').id)

# # Find songs guessed by first User
# # songs_guessed = Submission.first.songs

# # Find songs played at first Show
# # songs_played = Show.first.songs

# # Return matches
# # songs_guessed.where(song_name: songs_played.map{|song| song.song_name})	