class SessionsController < ApplicationController
	skip_before_action :authorize, only:[:new, :create,:destroy]

	def new
		if signed_in?
			redirect_to "/"
		else
			render :new
		end
	end

	def create
		user = User.find_by_email( params[:session][:email].downcase )
  	if user && user.authenticate( params[:session][:password] )

      if params[:session][:remember_me] == "checked"
        signin user, :temporary
      else
        signin user, :permanent
      end

  		redirect_to "/"
  	else
  		flash[:error] = 'Invalid email/password combination'
    	render "new"
  	end
	end

	def destroy
		current_user.update_attribute(:remember_token, User.encrypt(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
		redirect_to login_url
	end

end
