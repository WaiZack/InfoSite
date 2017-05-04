class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_filter :redirect_subdomain

  def redirect_subdomain
    if request.host == 'https://www.bizitfestival.com'
      redirect_to 'https://bizitfestival.com' + request.fullpath, :status => 301
    end
  end

end
