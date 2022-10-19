class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end
  def new
    @room = Room.new
  end
  def show
    @room = Room.find[params[:id]]
  end

    
  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def room_params
    params.require(:room).permit(:room_name, :concept, :category_id, :area_id).merge(user_id: current_user.id)
  end

end

