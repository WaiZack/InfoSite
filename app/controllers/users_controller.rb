class UsersController < ApplicationController


  def new
    @user = User.new
    @acad_lvl = ['Polytechnic','Junior College', 'Undergraduate', 'Postgraduate']
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to '/login'
    else
      render 'new'
    end
  end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :institute,:terms_and_conditions,:data_protection_policy,
      :firstName, :lastName, :specialization, :academic_level, :nric)
    end



end
