class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @chat_rooms = @user.chat_rooms
    @direct_rooms = @user.direct_rooms
  end

end
