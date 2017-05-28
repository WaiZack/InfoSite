class SubmissionsController < ApplicationController

  def create
    @submission = Submission.new(submission_params)
    team = @submission.team
    # if team.track == 'Big Data' or team.track == 'FinTech'
    #   flash[:danger] = 'Submission has closed for this track!'
    # else
    if @submission.content_data == nil
      flash[:danger] = 'Please select a file for upload!'
    else
      if @submission.save
        flash[:info] = 'File Uploaded'
      else
        error_msg = @submission.errors[:content]
        flash[:danger] = error_msg
      end
    end
    # end
    redirect_to :back


  end

  def update
    @submission = Submission.find(params[:id])
    name = ActiveSupport::JSON.decode(@submission.content_data)['metadata']['filename']
    @submission.destroy

    flash[:success] = name + ' Deleted'
    redirect_to :back
  end
  private
  def submission_params
    params.require(:submission).permit(:team_id, :content)
  end
end
