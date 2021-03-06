class UsersController < ApplicationController

  before_action :require_current_user!, except: [:create, :new]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in!(@user)
      render :show
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user.nil?
      flash.now[:errors] = "Couldn\'t find the user"
      render :new
    else
      render :show
    end
  end

  def index
    @users = User.all
    render :index
  end

  private
  def user_params
    params.require("user").permit(:email, :password)
  end
end