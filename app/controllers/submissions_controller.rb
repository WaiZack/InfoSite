class SubmissionsController < ApplicationController

  def create
    @submission = Submission.new(submission_params)
    @submission.save
  end

  private
  def submission_params
    params.require(:submission).permit(:team_id, :content)
  end
end
