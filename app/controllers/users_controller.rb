class UsersController < ApplicationController

  def new
    # @existing_emails = User.select('email').from('users')
  end

  def create
    user = User.new(user_params)
    if user.user_with_same_email(:email.to_s) == false
      if user.save
        session[:user_id] = user.id
        redirect_to '/'
      else
        redirect_to '/signup'
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
