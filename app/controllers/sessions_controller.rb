class SessionsController < ApplicationController

  before_action :logged_in_user, only: [:new]

  def logged_in_user
    if logged_in?
      redirect_to '/myTeams'
    end
  end


  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        redirect_to '/myTeams'
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to '/login'
      end

    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
