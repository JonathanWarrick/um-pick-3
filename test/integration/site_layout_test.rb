require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
	test "home page links" do
	  get root_path
	  assert_template 'static_pages/home'
	  assert_select "a[href=?]", contact_path
	  get signup_path
	  assert_select 'title', provide_title("Sign Up")
	end
end
