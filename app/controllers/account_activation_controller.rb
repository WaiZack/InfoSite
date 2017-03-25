class AccountActivationController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      flash[:success] = "Account activated!"
      redirect_to '/login'
    else
      flash[:danger] = "Invalid activation link"
      redirect_to '/login'
    end
  end

end