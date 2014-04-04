module SessionsHelper

	def signin(user)
    token = User.new_remember_token
    cookies.permanent[:remember_token] =  token
    user.update_attribute(:remember_token, User.encrypt(token))
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
      begin
        remember_token = User.encrypt(cookies[:remember_token])
        User.find_by(remember_token: remember_token)
      end
  end
end
