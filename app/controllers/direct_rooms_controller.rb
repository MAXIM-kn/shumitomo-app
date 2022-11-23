class DirectRoomsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def new
    @direct_room = DirectRoom.new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @direct_room = DirectRoom.new(direct_room_params)
    if @direct_room.save
      redirect_to user_direct_room_direct_messages_path(@user, @direct_room)
    else
      render :new
     end
  end

  def destroy
    direct_room_user = DirectRoomUser.find_by(direct_room_id: params[:id])
    @direct_room_user = direct_room_user.direct_room
    if @direct_room_user.destroy
      flash[:success] = "削除が完了しました"
      redirect_to root_path
    end
  end

  private
   
    def direct_room_params
      params.require(:direct_room).permit(:subject, [user_ids: []])
    end
end
