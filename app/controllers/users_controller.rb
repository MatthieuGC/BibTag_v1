class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def new
    @user = User.new
    @title = "Sign up!"
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "You are now registered !"
    else
      @titre = "Sign Up!"
      render 'new'
    end
  end
  
  def user_params
    params.require(:user).permit(:nom, :email, :password, :password_confirmation)
  end
end
