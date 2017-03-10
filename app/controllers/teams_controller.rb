class TeamsController < ApplicationController

  before_action :created_too_many_teams?, only: [:new]
  before_action :logged_in_user

  def logged_in_user
    unless logged_in?
      flash[:danger] = 'You are not logged in'
      redirect_to login_url
    end
  end

  def new
    @team = Team.new
    @tracks = ['Big Data', 'FinTech', 'Smart Nation']
  end

  def show
    @user = User.find_by(id: session[:user_id])
    @team = Team.find(params[:id])
    @num = @team.users.count
    @team.update_attribute(:numMember, @num)

    @request = MembershipRequest.new

  end

  def edit
  end

  def index
    @teams = Team.all
  end

  def create
    user = User.find_by(id: session[:user_id])
    @tracks = ['Big Data', 'FinTech', 'Smart Nation']

    @team = Team.new(team_params)
    @team.creator = user.id
    @team.numMember = 1
    @team.save

    membership = Membership.new(team_id: @team.id, user_id:user.id)

    if membership.save
      flash[:info] = 'Team Created'
      redirect_to '/teams'
    else
      render 'new'
    end
  end

  def myteams
    user = User.find_by(id: session[:user_id])
    @teams = user.teams.all
    @incoming_requests = MembershipRequest.where(user_id: user.id).where('status = ?', 'Pending')
    @outgoing_requests = MembershipRequest.where(requester_id: user.id).where('status = ?', 'Pending')

  end


  private
  def team_params
    params.require(:team).permit(:name, :track)
  end

  def created_too_many_teams?
    @user = User.find_by(id: session[:user_id])
    if @user.teams.count == 3
      flash[:danger] = 'You already belong to 3 teams!'
      redirect_to '/teams'
    end


  end

end
