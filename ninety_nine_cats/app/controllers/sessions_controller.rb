class SessionsController < ApplicationController

  before_action :already_singed_in!, except: [:destroy]

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if @user.nil?
      redirect_to new_user_url
    else
      login!(@user)
      redirect_to cats_url
    end

  end

  def destroy
    logout!
    redirect_to new_session_url
  end

end
