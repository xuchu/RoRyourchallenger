class SessionsController < ApplicationController
	skip_before_action :authorize, only:[:new,:create,:destroy]

	def new
		render :new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		if params[:session][:remember_me] == "checked"
        signin user
			elsif params[:session][:remember_me] == "unchecked"
				session[:user_id] = user.id
  		end
  		redirect_to "/"
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
