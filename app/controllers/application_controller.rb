class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :authorize
  

  protected
		def authorize		
		  unless signed_in?
				redirect_to login_url
			end
		end
end
