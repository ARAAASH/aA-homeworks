class UsersController < ApplicationController
  def index
  
    u = params[:username]
    if u
      user = User.find_by('username LIKE ?', "%#{u}%")
      render json: user
    else
      render json: User.all
    end
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    user = User.find(params[:id])
    if user
      render json: user
    else
      render json: user.errors.full_messages
    end
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: user
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end
end
