class ChatMessagesController < ApplicationController
  before_action :set_chat_room_user, only: [:index, :create]
  before_action :set_chat_room, only: [:index, :create]

  def index
    @chat_message = ChatMessage.new
    @chat_messages = @chat_room.chat_messages.includes(:user)
  end

  def create
    @chat_message = @chat_room.chat_messages.new(chat_message_params)
    if @chat_message.save
      redirect_to chat_room_chat_messages_path(@chat_room)    
    else
      @chat_messages = @chat_room.chat_messages.includes(:user)
      render :index
    end
  end

  private

  def chat_message_params
    params.require(:chat_message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def set_chat_room_user
    @chat_room_user = ChatRoomUser.where(params[:id])
  end

  def set_chat_room
    @chat_room = ChatRoom.find(params[:chat_room_id])
  end

end