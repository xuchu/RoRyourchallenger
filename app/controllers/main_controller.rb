class MainController < ApplicationController
	#this is the controller of the home page
  def home
  	render :layout => "home_layout"
  end
end
