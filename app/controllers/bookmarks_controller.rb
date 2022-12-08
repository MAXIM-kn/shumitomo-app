class BookmarksController < ApplicationController

  def create
    @chat_room = ChatRoom.find(params[:chat_room_id])
    @bookmark = @chat_room.bookmarks.new(user_id: current_user.id)
    if @bookmark.save
      respond_to do |format|
        format.html { redirect_to request.referer }
        format.js
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    @chat_room = ChatRoom.find(params[:chat_room_id])
    @bookmark = @chat_room.bookmarks.find_by(user_id: current_user.id)
    if @bookmark.destroy
      respond_to do |format|
        format.html { redirect_to request.referer }
        format.js
      end
    else
      redirect_to root_path
    end
  end

end
