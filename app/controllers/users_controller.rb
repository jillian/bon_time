class UsersController < Devise::RegistrationsController
  before_filter :authenticate_user!

  def index
    if user_signed_in?
      @users = User.all
      @friends = current_user.friends
    else
      redirect_to new_user_session_path, notice: "You need to sign in or sign up before continuing."
    end
  end

  def show
    if user_signed_in?
      @user = User.find params[:id]
      @location = current_user.locations.new
      # @invites = @user.pending_friendships.includes(:user)
      @friends = current_user.friends
    else
      redirect_to new_user_session_path, notice: "You need to sign in or sign up before continuing."
    end
  end

  def update
  end

end
