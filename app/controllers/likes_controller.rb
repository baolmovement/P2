class LikesController < ApplicationController 
  before_action :authorize, only: [:create]
  def create  
    unless logged_in?
      redirect_to new_user_path
    end
#Creates new like---------------------------------------------------------  
    @user = current_user.id
    @post = params[:post_id]
    likes = {user_id: @user, post_id: @post}
    @like = Like.new(likes)
    @like.save!
    
#Redirects to post's show page after a new like---------------------------------------------------------      
    if @like.save
      redirect_to root_path
    end 
#-----------------------------------------------------  
  
#-----------------------------------------------------  
    
#-----------------------------------------------------   
  end
#-----------------------------------------------------  
end
