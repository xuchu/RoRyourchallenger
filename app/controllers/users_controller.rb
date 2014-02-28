class UsersController < ApplicationController
  skip_before_action :authorize, only: [:new, :create]
  def new
  	@user = User.new
  end

  def create
    @user = User.new
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    if !@user.valid?
      render :new
    else
      @user.save
    end
  end

  def show
    @user = User.find_by(id: session[:user_id])
  end

  private
    # Using a private method to encapsulate the permissible parameters is just a good pattern
    # since you'll be able to reuse the same permit list between create and update. Also, you
    # can specialize this method with per-user checking of permissible attributes.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
