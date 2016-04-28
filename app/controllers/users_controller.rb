class UsersController < ApplicationController

  def index
    if current_user.admin
      @users = User.all
    else
      redirect_to root_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user), flash: {notice: 'Thanks for signing up'}
    else
      redirect_to new_user_path, flash: {alert: 'There was a problem creating the user'}
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), flash: {notice: "User was successfully updated."}
    else
      redirect_to user_path(@user), flash: {error: "There was a problem updating the user."}
    end
  end

  def destroy
  end

  private

    def user_params
      params.require(:user).permit(:name, :height, :nausea, :tickets, :admin, :happiness)
    end
end
