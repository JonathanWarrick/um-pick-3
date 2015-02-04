require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

	def setup
		@base_title = "Umphrey's Pick 3"
	end

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", @base_title
  end

  test "should get contact" do
  	get :contact
  	assert_response :success
  	assert_select "title", "#{@base_title} | Contact"
  end

end
