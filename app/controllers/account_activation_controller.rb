class AccountActivationController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash.now[:success] = "Account activated!"
      redirect_to '/login'
    else
      flash.now[:danger] = "Invalid activation link"
      redirect_to '/login'
    end
  end

end