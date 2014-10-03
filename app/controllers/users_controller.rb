class UsersController < ApplicationController
  def new
  	@User = User.new
  end

   def create 
    @User = User.new(params.require(:user).permit(:user_name, :email, :phone, :password_digest)) 
    if @User.save       
    	redirect_to(:action => 'index')
    # Handle a successful save. 
    else 
      render 'new' 
    end 
    end
end
