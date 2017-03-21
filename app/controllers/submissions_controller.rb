class SubmissionsController < ApplicationController

  def create
    @submission = Submission.new(submission_params)
    if @submission.save
      flash[:info] = 'File Uploaded'
    else
      error_msg = @submission.errors[:content]
      flash[:danger] = error_msg
    end
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
