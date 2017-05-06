class RecruitsController< ApplicationController


  def show
    @recruit = Recruit.all
    @user = User.find_by(id: session[:user_id])


  end

  def new
    @recruit = Recruit.new
    @user = User.find_by(id: session[:user_id])
    @teams = @user.teams.all

  end

  def create
    @recruit = Recruit.new(recruit_params)
    @team = Team.find(@recruit.team_id)
    @recruit.team_name = @team.name
    if @recruit.save
      redirect_to '/recruit'
    else
      flash[:danger] = 'Fill in all fields'
      redirect_to :back
      end

  end

  def delete
    @user = User.find_by(id: session[:user_id])
    @recruit = Recruit.find_by(id: params[:id])
    if @recruit && @recruit.email == @user.email
      @recruit.delete
      flash[:success] = 'Recruitment notice deleted'
      redirect_to '/recruit'
    else
      flash[:danger] = 'You don\'t have permssion to do that'
      redirect_to '/recruit'
    end

  end

  private
  def recruit_params
    params.require(:recruit).permit(:team_id, :email, :content)
  end
end
