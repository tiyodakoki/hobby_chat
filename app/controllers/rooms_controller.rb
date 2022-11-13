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
  def category
    @rooms = Room.category(params[:category_id])
  end
  def search
    if (params[:keyword]) == '#'
      @rooms = Tag.search(params[:keyword]).order('created_at DESC')
    else
      @rooms = Room.search(params[:keyword]).order('created_at DESC')
    end
  end
  def room_user
    # @room = Room.find(params[:id])
    # RoomUser.create(room_params)
    # redirect_to action: :index
    # end
    
      @room = Room.find(params[:id])
      user = User.find(params[:id])
      @room.users << current_user
      redirect_to room_messages_path(@room.id)
  end
  def deroom_user
    @room = Room.find(params[:id])
    user = current_user
    
    room_user = RoomUser.find_by(user_id: user.id, room_id: @room.id)
    room_user.delete
    redirect_to room_messages_path(@room.id)
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
  
  # def good_params
  #   params.merge(propose_id: @propose.id, user_id: current_user.id)
  # end
  
 
  # def room_params
  #   params.require(:room).merge(user_id: current_user.id, room_id: params[:room_id])
  # end

end

