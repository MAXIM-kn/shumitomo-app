class UsersController < ApplicationController

  def show
    @chat_rooms = ChatRoom.all
    @user = User.find(params[:id])
  end

end
