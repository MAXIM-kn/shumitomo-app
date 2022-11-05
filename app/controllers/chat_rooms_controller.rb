class ChatRoomsController < ApplicationController
  before_action :set_chat_room_user, only: [:show, :edit]

  def index
    @genres = Genre.where(:id => 2..8)
  end

  def new
    @chat_room_category = ChatRoomCategory.new
  end

  def create
    @chat_room_category = ChatRoomCategory.new(chat_room_category_params)
    if @chat_room_category.valid?
      @chat_room_category.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def chat_room_category_params
    params.require(:chat_room_category).permit(:name, :introduction, :genre_id, :image, :user_id).merge(user_id: current_user.id, owner_id: current_user.id)
  end

  def set_chat_room_user
    @chat_room_user = ChatRoomUser.find(params[:id])
  end

end