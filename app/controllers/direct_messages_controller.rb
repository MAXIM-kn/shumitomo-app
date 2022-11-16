class DirectMessagesController < ApplicationController

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
    if @direct_message.save
      redirect_to user_direct_room_direct_messages_path
    else
      @direct_messages = @direct_room.chat_messages.includes(:user)
      render :index
    end
  end

  private

  def direct_message_params
    params.require(:direct_message).permit(:content, :image, :direct_room_id, :user_id).merge(user_id: current_user.id, direct_room_id: params[:direct_room_id])
  end

end
