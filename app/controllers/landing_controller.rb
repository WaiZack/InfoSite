class LandingController < ApplicationController

  def home
    @mailing_list = MailingList.new
  end

end
