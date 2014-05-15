class UsersController < ApplicationController
  skip_before_action :authorize, only: [:new, :create]


  def new
    if signed_in?
      redirect_to "/"
    else
  	  @user = User.new
      render :new
    end
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        Mailer.welcome_email(@user).deliver
        format.html { redirect_to "/" }
      else
        format.html { redirect_to "/signup" }
      end
    end
  end

  def show
    @user = current_user
  end

  private
    # Using a private method to encapsulate the permissible parameters is just a good pattern
    # since you'll be able to reuse the same permit list between create and update. Also, you
    # can specialize this method with per-user checking of permissible attributes.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
