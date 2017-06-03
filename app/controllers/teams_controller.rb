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
    # @tracks = ['Big Data', 'FinTech', 'Smart Nation']
    @tracks = ['Smart Nation']
    # @tracks = []
  end

  def update
    @team = Team.find(params[:id])
    @team.update_attributes(requirements)
    flash[:info] = 'Requirements updated!'
    redirect_to :back
  end

  def show
    @user = User.find_by(id: session[:user_id])
    @team = Team.find(params[:id])
    @num = @team.users.count
    @team.update_attribute(:numMember, @num)

    @request = MembershipRequest.new

    @submission = Submission.new

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

    @sameTrackTeams = Team.where(track: @team.track)
    if (user.teams.all & @sameTrackTeams).empty?
      @team.save
      membership = Membership.new(team_id: @team.id, user_id:user.id)

      if membership.save
        flash[:info] = 'Team Created'
        redirect_to '/teams'
      else
        render 'new'
      end
    else
      flash[:warning] = 'You already belong to a team of that track!'
      redirect_to '/teams'
    end
  end

  def myteams
    user = User.find_by(id: session[:user_id])
    @teams = user.teams.all
    @incoming_requests = MembershipRequest.where(user_id: user.id).where('status = ?', 'Pending')
    @outgoing_requests = MembershipRequest.where(requester_id: user.id)

  end

  def remove
    @user = User.find_by(id: session[:user_id])
    @team = Team.find_by(id: params[:team])
    @member = User.find_by(id: params[:member])
    # request = MembershipRequest.where(requester_id: @member.id).where(team_id: @team.id).first()

    if @user.id == @team.creator && @member.id!=@user.id && request
      # MembershipRequest.find(request.id).delete
      @team.users.delete(@member)

      redirect_to '/myTeams'
    else
      flash[:danger] = 'You do not have permission to do that!'
      redirect_to '/myTeams'
    end
  end

  def quit
    @user = User.find_by(id: session[:user_id])
    @team = Team.find_by(id: params[:team])
    if @team.creator == @user.id
      flash[:danger] = 'The leader is unable to leave the group!'
      render 'show'
    elsif @team.users.all.include?(@user)
      flash[:info] = 'You quit the group'
      @team.users.delete(@user)
      render 'show'
    else
      flash[:danger] = 'Invalid action'
      redirect_to '/myTeams'
    end

  end

  def delete
    @user = User.find_by(id: session[:user_id])
    @team = Team.find_by(id: params[:team])
    if @team && @team.creator == @user.id
      flash[:success] = 'Team deleted'
      MembershipRequest.where(:team_id => @team.id).update_all(status: 'Team deleted')

      Membership.where(:team_id => @team.id).delete_all
      Team.find(@team.id).delete
      redirect_to '/myTeams'
    else
      flash[:danger] = 'You don\'t have permssion to do that'
      redirect_to '/myTeams'
    end

  end


  private
  def team_params
    params.require(:team).permit(:name, :track)
  end

  def requirements
    params.require(:team).permit(:requirements)
  end

  def created_too_many_teams?
    @user = User.find_by(id: session[:user_id])
    if @user.teams.count == 3
      flash[:danger] = 'You already belong to 3 teams!'
      redirect_to '/teams'
    end


  end

end
