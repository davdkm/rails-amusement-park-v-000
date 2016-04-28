class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    # raise params.inspect
    user = User.find_by(session_params)
    if user
      session[:user_id] = user.id
      redirect_to user_path(user), flash: {notice: "Welcome back to the theme park!"}
    else
      redirect_to root_path
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

  private

    def session_params
      params.require(:user).permit(:id)
    end
end
