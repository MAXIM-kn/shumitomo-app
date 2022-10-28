class ChatRoomsController < ApplicationController

  def new
    @chat_room = ChatRoom.new
  end

  def create
  end

end
