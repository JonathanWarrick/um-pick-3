require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
	test 'provide title helper' do
		assert_equal provide_title, "Umphrey's Pick 3"
		assert_equal provide_title('Contact'), "Umphrey's Pick 3 | Contact"
	end
end