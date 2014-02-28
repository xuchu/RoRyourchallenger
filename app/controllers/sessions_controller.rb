class SessionsController < ApplicationController
	skip_before_action :authorize
	def new
		render :new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		session[:user_id] = user.id
    	redirect_to user_name_path(user)
  	else
  		flash[:error] = 'Invalid email/password combination'
    	render "new"
  	end
	end

	def destroy
		session[:user_id] = nil
		redirect_to login_url
	end

end
