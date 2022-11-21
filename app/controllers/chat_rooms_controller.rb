class ChatRoomsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :join]
  before_action :set_chat_room, only: [:show, :edit, :update]
  before_action :move_to_index, only: :edit

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
    @chat_room_user = ChatRoomUser.find_by(chat_room_id: params[:id])
    @user_joining = ChatRoomUser.where(user_id: params[:id])
  end

  def edit
  end  

  def update
    if @chat_room.update(chat_room_user_params)
      redirect_to chat_room_path
    else
      render :edit
    end
  end

  def destroy
    chat_room_user =ChatRoomUser.find(params[:id])
    @chat_room_user = chat_room_user.chat_room
    if @chat_room_user.destroy
      flash[:success] = "削除が完了しました"
      redirect_to root_path
    else
      render :index
    end
  end

  def join
    @chat_room = ChatRoom.find(params[:id])
    chat_room_user =ChatRoomUser.find_by(chat_room_id: params[:id])
    @chat_room_user = chat_room_user.chat_room
    @chat_room_user.users << current_user
    @chat_room_user.save
    redirect_to chat_room_chat_messages_path(@chat_room)
  end

  def withdrawal
    chat_room = ChatRoom.find(params[:id])
    chat_room_user =ChatRoomUser.find_by(user_id: current_user)
    if chat_room_user.destroy
      if chat_room.owner_id == current_user.id
        chat_room.destroy
        redirect_to root_path
      else
        redirect_to root_path
      end
    end
  end

  def search
    @genres = Genre.where(:id => 2..8)
    @chat_rooms = ChatRoom.search(params[:keyword])
  end

  private

  def chat_room_user_params
    params.require(:chat_room).permit(:name, :introduction, :genre_id, :image).merge(owner_id: current_user.id)
  end

  def chat_room_category_params
    params.require(:chat_room_category).permit(:name, :introduction, :genre_id, :image, :user_id, :owner_id).merge(user_id: current_user.id, owner_id: current_user.id)
  end

  def set_chat_room
    @chat_room = ChatRoom.find(params[:id])
  end

  def move_to_index
    @chat_room_user = ChatRoomUser.find_by(chat_room_id: params[:id])
    unless @chat_room_user.user == current_user
      redirect_to action: :index
    end
  end

end