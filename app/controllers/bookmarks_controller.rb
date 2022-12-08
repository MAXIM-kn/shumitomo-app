class BookmarksController < ApplicationController

  def create
    @chat_room = ChatRoom.find(params[:chat_room_id])
    @bookmark = @chat_room.bookmarks.new(user_id: current_user.id)
    @bookmark.save
    redirect_to request.referer
    #respond_to do |format|
        #format.html { redirect_to chat_room_path(@chat_room) }
        #format.js
    #end
  end

  def destroy
    @chat_room = ChatRoom.find(params[:chat_room_id])
    @bookmark = @chat_room.bookmarks.find_by(user_id: current_user.id)
    if @bookmark.present?
      @bookmark.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

end
