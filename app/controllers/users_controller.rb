class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_follow, only: [:follows, :followers]
  
  def show
    @user = User.find(params[:id])
    @chat_rooms = @user.chat_rooms
    @direct_rooms = @user.direct_rooms
    @following_users = @user.following_user
    @follower_users = @user.follower_user
  end

  def follows
  end
  
  def followers
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    if current_user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  private

  def set_follow
    user = User.find(params[:id])
    @users_following = user.following_user.page(params[:page]).per(20).order('updated_at DESC')
    @users_follower = user.follower_user.page(params[:page]).per(20).order('updated_at DESC')
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :image, :profile)
  end

end
