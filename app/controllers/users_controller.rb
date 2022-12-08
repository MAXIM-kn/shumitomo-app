class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :follows, :followers]
  before_action :set_follow, only: [:follows, :followers]
  before_action :notification_index, only: [:show, :check]
  before_action :direct_rooms_search, only: :show

  def show
    @user = User.find(params[:id])
    @chat_rooms = @user.chat_rooms
    @direct_rooms = @user.direct_rooms
    @following_users = @user.following_user
    @follower_users = @user.follower_user
    @bookmarks = Bookmark.where(user_id: current_user.id)
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
      flash[:notice] = "更新しました"
    else
      render :edit
    end
  end

  def destroy_all
    user = User.find(params[:id])
    @notifications = current_user.passive_notifications.destroy_all
    redirect_to user_path(user)
  end

  def check
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
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

  def notification_index
    if user_signed_in?
      @notifications = current_user.passive_notifications
      @notifications = @notifications.where.not(visitor_id: current_user.id)
    end
  end

  def direct_rooms_search
    user = User.find(params[:id])
    direct_rooms = user.direct_rooms
    @dm_owner = direct_rooms.find_by(owner_id: current_user)
    @dm_another = direct_rooms.find_by(another_id: current_user)
  end

end
