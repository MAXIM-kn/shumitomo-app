class ChatMessagesController < ApplicationController

  def index
    @chat_room_user = ChatRoomUser.where(params[:id])
    @chat_room = ChatRoom.find_by(params[:id])
  end

end
