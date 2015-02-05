require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
  	@user = User.new(
  		name: "Example User", 
  		email: "example@user.com",
  		password: "foobar",
  		password_confirmation: "foobar"
  	)
  end

  test 'should be valid' do
  	assert @user.valid?
  end

  test 'name should be present' do
  	@user.name = '   '
  	assert_not @user.valid?
  end

  test 'email should be present' do
  	@user.email = '   '
  	assert_not @user.valid?
  end

  test 'name should be at least six characters' do
  	@user.name = 'abcde'
  	assert_not @user.valid?
	end

	test 'name should be at most 32 characters' do
  	@user.name = 'a' * 50
  	assert_not @user.valid?
	end

	test 'email should have proper format' do
		@user.email = 'example@user'
		assert_not @user.valid?
	end

	test 'email addresses should be unique' do
		duplicate_user = @user.dup
		duplicate_user.email = @user.email.upcase
		@user.save
		assert_not duplicate_user.valid?
	end

  test 'password should be at least six characters' do
  	@user.password = @user.password_confirmation = 'abcde'
  	assert_not @user.valid?
	end

end
