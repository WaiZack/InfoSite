class VotesController < ApplicationController

  def new
    @vote = Vote.new
    @teams = Team.pluck(:name)
  end

  def create
    @vote = Vote.new(votes_param)
    @teams = Team.pluck(:name)
    if @vote.save
      redirect_to '/votingDone'
    else
      render 'new'
    end

  end

  def done

  end


  private
  def votes_param
    params.require(:vote).permit(:name, :email, :institute, :choice, :phone)
  end
end
