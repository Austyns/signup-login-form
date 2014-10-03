class PassController < ApplicationController
   def index
    
  end

  def login
   
  end

  def attempt_login
    if params[:user_name].present? && params[:password_digest].present?
      present_user = User.where(:user_name => params[:user_name]).first
      if present_user
        authorized_user = present_user.authenticate(params[:password_digest])
      end
    end
    if authorized_user
     
      session[:user_id] = authorized_user.id
      session[:user_name] = authorized_user.username
      flash[:notice] = "You are now logged in."
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to(:action => 'login')
    end
  end

  def logout
    session[:user_id] = nil
    session[:user_name] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => "login")
  end
end