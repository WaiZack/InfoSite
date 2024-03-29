class MembershipRequestsController < ApplicationController

  before_action :valid?, only: [:approve, :reject]
  before_action :logged_in_user

  def logged_in_user
    unless logged_in?
      flash[:danger] = 'You are not logged in'
      redirect_to login_url
    end
  end

  def new
    @team = Team.find(params[:team_id])
    @user = User.find_by(id: session[:user_id])
    @request = MembershipRequest.new(request_params)
    @request.user_id = @team.creator
    @request.email = @user.email
    @request.status = 'Pending'
    @request.requester_id = @user.id
    @request.teamName = @team.name
    @sameTrackTeams = Team.where(track: @team.track)

    if !(@user.teams.all & @sameTrackTeams).empty?
      flash[:danger] = 'You are already part of a team from the same track!'
      redirect_to '/myTeams'
    elsif @team.memberships.count == 4
      flash[:danger] = 'This team already has the maximum number of members!'
      redirect_to '/myTeams'
    else
      if @request.save
        flash[:info] = 'Request submitted'
        redirect_to '/myTeams'
      else
        flash[:danger] = 'You have already submitted a request to that team!'
        redirect_to '/myTeams'
      end
    end


  end

  def approve
    @user = User.find_by(id: session[:user_id])
    @request = MembershipRequest.find_by(id: params[:request_id])

    @requester = User.find_by(id: @request.requester_id)

    @team = Team.find_by(id: @request.team_id)
    @sameTrackTeams = Team.where(track: @team.track)
    membership = Membership.new(team_id: @team.id, user_id:@request.requester_id)


    if @user.id == @team.creator

      if @team.memberships.count == 4
        flash[:danger] = 'Your team has the maximum number of members!'
        redirect_to '/myTeams'
      else
        if !(@requester.teams.all & @sameTrackTeams).empty?
          flash[:danger] = 'This user already belongs to a team in this track!'
          redirect_to '/myTeams'
        else
          if membership.save
            @request.update_attribute(:status, 'Approved')
            flash[:info] = 'Member added!'
            redirect_to '/myTeams'
          else
            flash[:danger] = 'This person is already part of the team!'
            redirect_to '/myTeams'
          end
        end

      end
    else
      flash[:danger] = 'Invalid action!'
      redirect_to '/myTeams'
    end


  end


  def reject
    @user = User.find_by(id: session[:user_id])
    @request = MembershipRequest.find_by(id: params[:request_id])
    team = Team.find_by(id: @request.team_id)
    if team.creator == @user.id
      flash[:info] = 'Request rejected!'
      @request.update_attribute(:status, 'Rejected')
      redirect_to :back
    else
      flash[:danger] = 'Invalid action!'
      redirect_to '/myTeams'
    end
  end


  def create

  end

  private
  def valid?
    @user = User.find_by(id: session[:user_id])
    @request = MembershipRequest.find_by(id: params[:request_id])
    if @user.id != @request.user_id
      flash[:danger] = 'Invalid action!'
      redirect_to '/teams'
    end


  end

  def request_params
    params.permit(:team_id)
  end
end
