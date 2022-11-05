class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @chat_rooms = @user.chat_rooms
  end

end
