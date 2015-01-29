# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Populate Songs List
Song.create(song_name: 'Resolution')
Song.create(song_name: 'Believe The Lie')
Song.create(song_name: 'Anchor Drops')

# Populate Users List
User.create(name: 'Jonathan Warrick', email: 'Jonathan@Test.com')
User.create(name: 'Danny Warrick', email: 'Danny@Test.com')

# Populate Submissions List
User.first.submissions.create
User.last.submissions.create

# Populate Guesses List
Submission.first.guesses.create
Submission.last.guesses.create