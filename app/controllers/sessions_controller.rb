class SessionsController < ApplicationController
	skip_before_action :authorize, only:[:new, :create, :destroy]

  # Don't uncomment below code. It's just for explanation.
  #  get '/signin', to: 'sessions#new', as: :login
	def new
		if signed_in?
			redirect_to "/"
		else
			render :new
		end
	end

  # when a user enter username and password in login page, then come to here
	def create
		user = User.find_by_email( params[:session][:email].downcase )
  	if user && user.authenticate( params[:session][:password] )
      signin user
  		redirect_to "/"
  	else
  		flash[:error] = 'Invalid email/password combination'
    	render "new"
  	end
	end

  #user log out
	def destroy
		current_user.update_attribute(:remember_token, User.encrypt(User.new_remember_token))
    cookies.delete(:remember_me)
    self.current_user = nil
		redirect_to login_url
	end

end
