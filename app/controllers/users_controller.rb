class UsersController < ApplicationController 

  before_action :authorize, only: [:show, :edit, :update, :destroy]
#Initiates cookie history once user is authenticated--------------------------------------------------------------------------------

  def home  
    @users = User.all
  end
  def index 
    @users = User.all
  end

  def show 
 
  end

  def new 
    @user = User.new
  end

  def create 
    @user = User.new(user_params) 
    if @user.save
      redirect_to new_session_path   
    end
  end

  def edit 
    @user = User.find(params[:id])
  end

  def update 
    @user = User.find(params[:id])
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]   
    @user.save
    redirect_to user_path(@user)
  end

  def destroy 
    current_user.destroy 
    session[:user_id] = nil #deletes cookies 
    redirect_to new_user_path
  end

private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
