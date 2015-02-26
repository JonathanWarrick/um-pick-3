# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Populate Users List
User.create(name: 'Jonathan Warrick', email: 'Jonathan@Test.com', password: 'testing123', password_confirmation: 'testing123')
User.create(name: 'Danny Warrick', email: 'Danny@Test.com', password: 'testing123', password_confirmation: 'testing123')
User.create(name: 'Jim Warrick', email: 'Jim@Test.com', password: 'testing123', password_confirmation: 'testing123')
User.create(name: 'Carole Warrick', email: 'Carole@Test.com', password: 'testing123', password_confirmation: 'testing123')
User.create(name: 'Alana Irwin', email: 'Alana@Test.com', password: 'testing123', password_confirmation: 'testing123')

# Populate Guesses for First 5 Shows - Jonathan
# Define current_user
current_user = User.find_by_email('Jonathan@Test.com')

# None Right
current_user.submissions.create({:show_id => 1})
current_submission = current_user.submissions.find_by_show_id(1)
current_submission.guesses.create({:song_id => Song.find_by_song_name('All Things Ninja').id})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Hurt Bird Bath').id})
current_submission.guesses.create({:song_id => Song.find_by_song_name('August').id})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Southern Cross').id})

# First Right
current_user.submissions.create({:show_id => 2})
current_submission = current_user.submissions.find_by_show_id(2)
current_submission.guesses.create({:song_id => Song.find_by_song_name('Uncle Wally').id})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Hangover').id})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Prowler').id})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Lively Up Yourself').id})

# Second Right
current_user.submissions.create({:show_id => 3})
current_submission = current_user.submissions.find_by_show_id(3)
current_submission.guesses.create({:song_id => Song.find_by_song_name('Uncle Wally').id})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Bridgeless').id})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Prowler').id})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Lively Up Yourself').id})

# Third Right
current_user.submissions.create({:show_id => 4})
current_submission = current_user.submissions.find_by_show_id(4)
current_submission.guesses.create({:song_id => Song.find_by_song_name('The Crooked One').id})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Dump City').id})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Wappy Sprayberry').id})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Lively Up Yourself').id})

# Cover Right
current_user.submissions.create({:show_id => 5})
current_submission = current_user.submissions.find_by_show_id(5)
current_submission.guesses.create({:song_id => Song.find_by_song_name('The Crooked One').id})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Dump City').id})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Resolution').id})
current_submission.guesses.create({:song_id => Song.find_by_song_name("Let's Dance").id})

# Populate Guesses for First 5 Shows - Danny
# Define current_user
current_user = User.find_by_email('Jonathan@Test.com')
# Two Right
current_user.submissions.create({:show_id => 1})
current_submission = current_user.submissions.find_by_show_id(1)
current_submission.guesses.create({:song_id => Song.find_by_song_name('Hangover').id})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Sociable Jimmy').id})
current_submission.guesses.create({:song_id => Song.find_by_song_name('August').id})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Southern Cross').id})

# Three Right (BONUS)
current_user.submissions.create({:show_id => 2})
current_submission = current_user.submissions.find_by_show_id(2)
current_submission.guesses.create({:song_id => Song.find_by_song_name('Higgins').id})
current_submission.guesses.create({:song_id => Song.find_by_song_name('2x2').id})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Push the Pig').id})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Immigrant Song').id})

# All Right (BONUS)
current_user.submissions.create({:show_id => 3})
current_submission = current_user.submissions.find_by_show_id(3)
current_submission.guesses.create({:song_id => Song.find_by_song_name('Professor Wormbog').id})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Cemetery Walk').id})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Cemetery Walk II').id})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Led Boots').id})

# All Right + First Right (BONUS)
current_user.submissions.create({:show_id => 4})
current_submission = current_user.submissions.find_by_show_id(4)
current_submission.guesses.create({:song_id => Song.find_by_song_name('Puppet String').id})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Bad Friday').id})
current_submission.guesses.create({:song_id => Song.find_by_song_name('1348').id})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Live and Let Die').id})

# First Right (BONUS)
current_user.submissions.create({:show_id => 4})
current_submission = current_user.submissions.find_by_show_id(4)
current_submission.guesses.create({:song_id => Song.find_by_song_name('You Got the Wrong Guy').id})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Bad Friday').id})
current_submission.guesses.create({:song_id => Song.find_by_song_name('1348').id})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Live and Let Die').id})



# # Find songs guessed by first User
# # songs_guessed = Submission.first.songs

# # Find songs played at first Show
# # songs_played = Show.first.songs

# # Return matches
# # songs_guessed.where(song_name: songs_played.map{|song| song.song_name})	