class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end
  def new
    @room = Room.new
  end
  def create
    @room = Room.new(room_params)
    @room.save
  end

  private
  def room_params
    params.require(:room).permit(:room_name, :concept, :category_id, :area_id)
  end

end

