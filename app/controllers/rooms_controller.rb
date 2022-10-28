class RoomsController < ApplicationController
  def index
    @rooms =Room.all
  end
  def new
    @room_form = RoomForm.new
  end
  def show
    @rooms = Room.category(params[:category_id])
  end
  def search
    keyword = params[:keyword]
    tag = params[:keyword]
    @rooms = Room.search(keyword, tag)
  end

    
  def create
    @room_form = RoomForm.new(room_form_params)
    if @room_form.valid?
      @room_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def room_form_params
    params.require(:room_form).permit(:room_name, :concept, :category_id, :area_id, :tag_name).merge(user_id: current_user.id)
  end

end

