module ApplicationHelper
	# Returns default page title if none is provided
	def provide_title(page_title = '')
		base_title = "Umphrey's Pick 3"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end
end
