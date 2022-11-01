class CategoriesController < ApplicationController

  def index
    
    @categories = Category.all
    @chat_rooms = ChatRoom.where(category_id: params[:category_id])
  end

end
