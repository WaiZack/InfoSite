class MailingListController < ApplicationController

  def new
    @mail = MailingList.new(mailing_list_params)
    if @mail.save
      flash[:info] = 'Thanks for registering your interest!'
    else
      flash[:warning] = 'Either the email is not valid or you have already signed up'
    end
    # redirect_to
    redirect_to root_url+'#mailing'
  end

  def new2
    @mail = MailingList.new(mailing_list_params)
    if @mail.save
      flash[:info] = 'Thanks for registering your interest!'
    else
      flash[:warning] = 'Either the email is not valid or you have already signed up'
    end
    # redirect_to
    redirect_to '/BiZiTalk#mailing2'
  end

  def mailing_list_params
    params.require(:mailing_list).permit(:email)
  end

  def index

  end
end
