class MainController < ApplicationController
	skip_before_action :authorize
	#this is the controller of the home page
  def home
  end
end
