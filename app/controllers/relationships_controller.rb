class RelationshipsController < ApplicationController
  before_action :set_user, only: [:create, :destroy]

  def create
    current_user.follow(params[:user_id])
    respond_to do |format|
      @user.create_notification_follow!(current_user)
      @following_users = @user.following_user
      @follower_users = @user.follower_user
      format.html { redirect_to request.referer }
      format.js 
    end
  end
  
  def destroy
    respond_to do |format|
      current_user.unfollow(params[:user_id])
      @following_users = @user.following_user
      @follower_users = @user.follower_user
      format.html { redirect_to request.referer }
      format.js 
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
  
end
