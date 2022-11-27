class LikesController < ApplicationController

  def create
    @chat_room = ChatRoom.find(params[:chat_room_id])
    @chat_room_like = Like.new(user_id: current_user.id, chat_room_id: params[:chat_room_id])
    respond_to do |format|
      if @chat_room_like.save
        format.html { redirect_to chat_room_path(@chat_room) }
        format.js
      else
        redirect_to root_path
      end
    end
  end

  def destroy
    @chat_room = ChatRoom.find(params[:chat_room_id])
    @chat_room_like = Like.find_by(user_id: current_user.id, chat_room_id: params[:chat_room_id])
    respond_to do |format|
      if @chat_room_like.destroy
        format.html { redirect_to chat_room_path(@chat_room) }
        format.js
      else
        redirect_to root_path
      end
    end
  end

end
