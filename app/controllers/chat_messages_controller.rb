class ChatMessagesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_chat_room_user, only: [:index, :create]
  before_action :set_chat_room, only: [:index, :create]
  before_action :join_move_to_index, only: :index

  def index
    @chat_message = ChatMessage.new
    @chat_messages = @chat_room.chat_messages.includes(:user)
  end

  def create
    @chat_messages = @chat_room.chat_messages.includes(:user)
    @chat_message = @chat_room.chat_messages.new(chat_message_params)
    @temp_ids = @chat_room.users.ids
    respond_to do |format|
      if @chat_message.save
        @chat_message.create_notification_chat_message!(current_user, @chat_message.id, @chat_room)
        format.html { redirect_to chat_room_chat_messages_path(@chat_room) }
        format.js 
      else
        @chat_messages = @chat_room.chat_messages.includes(:user)
        format.html { render :index }
      end
    end
  end

  private

  def chat_message_params
    params.require(:chat_message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def set_chat_room_user
    @chat_room_user = ChatRoomUser.where(chat_room_id: params[:chat_room_id])
  end

  def set_chat_room
    @chat_room = ChatRoom.find(params[:chat_room_id])
  end

  def join_move_to_index
    @chat_room = ChatRoom.find(params[:chat_room_id])
    unless ChatRoomUser.exists?(chat_room_id: @chat_room.id, user_id: current_user.id)
      redirect_to root_path
    end
  end

end
