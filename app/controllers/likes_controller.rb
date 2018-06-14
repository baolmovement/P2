class LikesController < ApplicationController 
  
  def create  
    
    #Creates new like---------------------------------------------------------  
    @user = current_user.id
    @post = params[:post_id]
    likes = {user_id: @user, post_id: @post}
    @like = Like.new(likes)
    @like.save!
    
    #Redirects to post's show page after a new like---------------------------------------------------------      
    if @like.save
      redirect_to post_path(@post)
    end
  
  end
#-----------------------------------------------------  
end
