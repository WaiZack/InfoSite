class DashboardController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update, :show]

  def logged_in_user
    unless logged_in?
      flash[:danger] = 'You are not logged in'
      redirect_to login_url
    end
  end

  def show
    @user = User.find_by(id: session[:user_id])
    @profile = User.find_by(email: params[:profile])
  end


  def edit
    @user = User.find_by(id: session[:user_id])
  end

  def update
    @user = User.find_by(id: session[:user_id])
    if @user.update_attributes(user_params)
      flash[:success] = 'Profile updated'
      redirect_to '/dash'
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:firstName,:lastName, :introduction, :email, :institute, :specialization, :academic_level)
  end

end
