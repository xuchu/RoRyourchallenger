module SessionsHelper

	def signin(user, duration)
    if duration == :temporary
      session[:remember_me] = user.id
    end

    if duration == :permanent
      token = User.new_remember_token
      cookies.permanent[:remember_me] =  token
      user.update_attribute(:remember_token, User.encrypt(token))
    end

    self.current_user = user
	end

	def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||=
      if session[:remember_me]
        User.find_by(id: session[:remember_me])
      else
        remember_token = User.encrypt(cookies[:remember_me])
        User.find_by(remember_token: remember_token)
      end
  end

end
