class TeamsController < ApplicationController


  def new
    @team = Team.new
    @tracks = ['Big Data', 'FinTech', 'Smart Nation']
  end

  def show
    @team = Team.find(params[:id])


  end

  def edit
  end

  def index
    @teams = Team.all
  end

  def create
    @user = User.find_by(id: session[:user_id])
    @tracks = ['Big Data', 'FinTech', 'Smart Nation']
    @team = Team.new(team_params)
    @team.creator = @user.email
    @team.numMember = 3
    if @team.save
      flash[:info] = 'Team Created'
      redirect_to '/teams'
    else
      render 'new'
    end
  end


  private
  def team_params
    params.require(:team).permit(:name, :track)
  end

end
