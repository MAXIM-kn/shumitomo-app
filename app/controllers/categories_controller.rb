class CategoriesController < ApplicationController

  def index
    @genres = Genre.where(:id => 2..8)
    @chat_rooms = ChatRoom.where(genre_id: params[:category_id]).includes(:users)
  end

end