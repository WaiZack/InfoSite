class NdasController < ApplicationController

  before_action :logged_in_user

  def logged_in_user
    unless logged_in?
      flash[:danger] = 'You are not logged in'
      redirect_to login_url
    end
  end

  def new
    @nda = Nda.new
  end

  def create
    @user = User.find_by(id: session[:user_id])
    @nda = Nda.new(nda_params)
    @nda.user_id = @user.id

    if @nda.save
      send_file 'app/assets/downloads/dataset.zip'
    else
      render 'new'
    end

  end

  private

  def nda_params
    params.require(:nda).permit(:nda)

  end

end
