class Settings::AccountsController < ApplicationController

  def account
    render :account
  end

  def password
    render :password
  end

  def profile
    render :profile
  end

  def update_account
    if current_user.name != params[:name]
      current_user.update_column( :name, params[:name] )
    end

    if current_user.username != params[:username]
      unless User.find_by_username( params[:username] )
        current_user.update_column( :username, params[:username] )
      else
        flash[:warning] = "This username #{params[:username]} has been taken. Please choose another."
      end
    end

    if current_user.email != params[:email]
      unless User.find_by_email( params[:email] )

        if params[:email] =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
          current_user.update_column( :email, params[:email] )
          flash[:email] = "ok"
        else
          flash[:warning] = "This email #{params[:email]} is incorrect."
        end

      else
        flash[:warning] = "This email #{params[:email]} has been taken. Please choose another."
      end
    end

    redirect_to '/settings/account'
  end

  def update_password
    if current_user.authenticate( params[:current_password] )

      if params[:new_password].length >= 6

        if params[:new_password] == params[:confirm_password]
          current_user.update_attribute(:password, params[:new_password])
          flash[:success] = "Password has been set successfully"
        else
          flash[:warning] = "New Password is not equal to Confirm Password"
        end

      else
        flash[:warning] = "Password must be at least 6 characters."
      end

    else
      flash[:warning] = "Current Password is wrong"
    end
    redirect_to '/settings/password'
  end


  def update_profile
    current_user.update_attribute(:avatar, params[:avatar])
    redirect_to '/settings/profile'
  end

end
