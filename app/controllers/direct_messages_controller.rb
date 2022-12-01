class DirectMessagesController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @direct_room = DirectRoom.find(params[:direct_room_id])
    @user = User.find_by(id: current_user.id)
    @direct_message = DirectMessage.new
    @direct_messages = @direct_room.direct_messages.includes(:user)
  end

  def create
    @direct_room = DirectRoom.find(params[:direct_room_id])
    @user = User.find_by(id: current_user.id)
    @direct_message = @direct_room.direct_messages.new(direct_message_params)
    respond_to do |format|
      if @direct_message.save
        partner_search
        @direct_message.create_notification_direct_message!(current_user, @direct_message.id, @partner)
        @direct_messages = @direct_room.direct_messages.includes(:user)
        format.html { redirect_to user_direct_room_direct_messages_path }
        format.js 
      else
        @direct_messages = @direct_room.direct_messages.includes(:user)
        format.html { render :index }
      end
    end
  end

  private

  def direct_message_params
    params.require(:direct_message).permit(:content, :image, :direct_room_id, :user_id).merge(user_id: current_user.id, direct_room_id: params[:direct_room_id])
  end

  def partner_search
    partner = @direct_room.users.where.not(id: current_user.id).each do |user|
    @partner = user.id
    end
  end

end
