class MailingListController < ApplicationController

  def new
    @mail = MailingList.new(mailing_list_params)
    if @mail.save
      flash[:info] = 'Thanks for signing up!'
    else
      flash[:warning] = 'Either the email is not valid or you have already signed ups'
    end
    # redirect_to
    redirect_to root_url+'#mailing'
  end

  def mailing_list_params
    params.require(:mailing_list).permit(:email)
  end
end
