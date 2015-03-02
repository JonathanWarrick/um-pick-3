class UsersController < ApplicationController
  def new
  	# Create empty user (but don't save!) to be populated
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
    @submissions = @user.submissions
    @shows = Show.all
    @songs = Song.all
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      log_in @user
      flash[:success] = "Welcome to Umphrey's Pick 3!"
      # Could also be redirect_to user_url(@user) but Rails knows better
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def index
    @users = User.all.order(total_score: :desc)
  end

  private
    def user_params
    	params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
