class ChatMessagesController < ApplicationController

  def index
    @chat_room_user = ChatRoomUser.where(params[:id])
  end

end
