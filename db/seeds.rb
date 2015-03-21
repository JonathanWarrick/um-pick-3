# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Populate Users List
User.create(name: 'Jonathan Warrick', email: 'Jonathan@Test.com', password: 'testing123', password_confirmation: 'testing123', admin: true, activated: true, activated_at: Time.zone.now)
User.create(name: 'Danny Warrick', email: 'Danny@Test.com', password: 'testing123', password_confirmation: 'testing123', activated: true, activated_at: Time.zone.now)
User.create(name: 'Jim Warrick', email: 'Jim@Test.com', password: 'testing123', password_confirmation: 'testing123', activated: true, activated_at: Time.zone.now)
User.create(name: 'Carole Warrick', email: 'Carole@Test.com', password: 'testing123', password_confirmation: 'testing123', activated: true, activated_at: Time.zone.now)
User.create(name: 'Alana Irwin', email: 'Alana@Test.com', password: 'testing123', password_confirmation: 'testing123', activated: true, activated_at: Time.zone.now)

# Populate Guesses for First 5 Shows - Jonathan
# Define current_user
current_user = User.find_by_email('jonathan@test.com')

# None Right
current_user.submissions.create({:show_id => 1})
current_submission = current_user.submissions.find_by_show_id(1)
current_submission.guesses.create({:song_id => Song.find_by_song_name('All Things Ninja').id, :is_opener => true, :is_cover => false})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Hurt Bird Bath').id, :is_opener => false, :is_cover => false})
current_submission.guesses.create({:song_id => Song.find_by_song_name('August').id, :is_opener => false, :is_cover => false})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Southern Cross').id, :is_opener => false, :is_cover => true})

# First Right
current_user.submissions.create({:show_id => 2})
current_submission = current_user.submissions.find_by_show_id(2)
current_submission.guesses.create({:song_id => Song.find_by_song_name('Uncle Wally').id, :is_opener => true, :is_cover => false})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Hangover').id, :is_opener => false, :is_cover => false})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Prowler').id, :is_opener => false, :is_cover => false})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Lively Up Yourself').id, :is_opener => false, :is_cover => true})

# Second Right
current_user.submissions.create({:show_id => 3})
current_submission = current_user.submissions.find_by_show_id(3)
current_submission.guesses.create({:song_id => Song.find_by_song_name('Uncle Wally').id, :is_opener => true, :is_cover => false})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Bridgeless').id, :is_opener => false, :is_cover => false})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Prowler').id, :is_opener => false, :is_cover => false})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Lively Up Yourself').id, :is_opener => false, :is_cover => true})

# Third Right
current_user.submissions.create({:show_id => 4})
current_submission = current_user.submissions.find_by_show_id(4)
current_submission.guesses.create({:song_id => Song.find_by_song_name('The Crooked One').id, :is_opener => true, :is_cover => false})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Dump City').id, :is_opener => false, :is_cover => false})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Wappy Sprayberry').id, :is_opener => false, :is_cover => false})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Lively Up Yourself').id, :is_opener => false, :is_cover => true})

# Cover Right
current_user.submissions.create({:show_id => 5})
current_submission = current_user.submissions.find_by_show_id(5)
current_submission.guesses.create({:song_id => Song.find_by_song_name('The Crooked One').id, :is_opener => true, :is_cover => false})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Dump City').id, :is_opener => false, :is_cover => false})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Resolution').id, :is_opener => false, :is_cover => false})
current_submission.guesses.create({:song_id => Song.find_by_song_name("Let's Dance").id, :is_opener => false, :is_cover => true})

# Populate Guesses for First 5 Shows - Danny
# Define current_user
current_user = User.find_by_email('danny@test.com')
# Two Right
current_user.submissions.create({:show_id => 1})
current_submission = current_user.submissions.find_by_show_id(1)
current_submission.guesses.create({:song_id => Song.find_by_song_name('Hangover').id, :is_opener => true, :is_cover => false})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Sociable Jimmy').id, :is_opener => false, :is_cover => false})
current_submission.guesses.create({:song_id => Song.find_by_song_name('August').id, :is_opener => false, :is_cover => false})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Southern Cross').id, :is_opener => false, :is_cover => true})

# Three Right (BONUS)
current_user.submissions.create({:show_id => 2})
current_submission = current_user.submissions.find_by_show_id(2)
current_submission.guesses.create({:song_id => Song.find_by_song_name('Higgins').id, :is_opener => true, :is_cover => false})
current_submission.guesses.create({:song_id => Song.find_by_song_name('2x2').id, :is_opener => false, :is_cover => false})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Push the Pig').id, :is_opener => false, :is_cover => false})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Immigrant Song').id, :is_opener => false, :is_cover => true})

# All Right (BONUS)
current_user.submissions.create({:show_id => 3})
current_submission = current_user.submissions.find_by_show_id(3)
current_submission.guesses.create({:song_id => Song.find_by_song_name('Professor Wormbog').id, :is_opener => true, :is_cover => false})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Cemetery Walk').id, :is_opener => false, :is_cover => false})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Cemetery Walk II').id, :is_opener => false, :is_cover => false})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Led Boots').id, :is_opener => false, :is_cover => true})

# All Right + First Right (BONUS)
current_user.submissions.create({:show_id => 4})
current_submission = current_user.submissions.find_by_show_id(4)
current_submission.guesses.create({:song_id => Song.find_by_song_name('Puppet String').id, :is_opener => true, :is_cover => false})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Bad Friday').id, :is_opener => false, :is_cover => false})
current_submission.guesses.create({:song_id => Song.find_by_song_name('1348').id, :is_opener => false, :is_cover => false})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Live and Let Die').id, :is_opener => false, :is_cover => true})

# First Right (BONUS)
current_user.submissions.create({:show_id => 5})
current_submission = current_user.submissions.find_by_show_id(5)
current_submission.guesses.create({:song_id => Song.find_by_song_name('You Got the Wrong Guy').id, :is_opener => true, :is_cover => false})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Bad Friday').id, :is_opener => false, :is_cover => false})
current_submission.guesses.create({:song_id => Song.find_by_song_name('1348').id, :is_opener => false, :is_cover => false})
current_submission.guesses.create({:song_id => Song.find_by_song_name('Live and Let Die').id, :is_opener => false, :is_cover => true})



# # Find songs guessed by first User
# # songs_guessed = Submission.first.songs

# # Find songs played at first Show
# # songs_played = Show.first.songs

# # Return matches
# # songs_guessed.where(song_name: songs_played.map{|song| song.song_name})	