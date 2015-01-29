class SubmissionsController < ApplicationController
	def new

	end

	def create	
		# shouldn't render view; for now, let's just render the stuff
		render plain: params[:submission].inspect
	end
end
