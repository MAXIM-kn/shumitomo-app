class DirectRoomsController < ApplicationController

  def new
    @direct_room = DirectRoom.new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @direct_room = DirectRoom.new(direct_room_params)
    if @direct_room.save!
      redirect_to root_path
    else
      render :new
     end
  end

  private
   
    def direct_room_params
      params.require(:direct_room).permit(:subject, [user_ids: []])
    end
end
