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
  def room_user
    # @room = Room.find(params[:id])
    # RoomUser.create(room_params)
    # redirect_to action: :index
    # end
    
      @room = Room.find(params[:id])
      user = User.find(params[:id])
      @room.users << user
      redirect_to action: :index
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
  def propose
    @room = Room.find(params[:id])
    @propose = Propose.new(propose_params)
    if @propose.save
    redirect_to room_messages_path(@room.id)
    end
  end
  def good
  @propose = Propose.find(params[:id])
  @good = Good.new(user_id: current_user.id, propose_id: @propose.id)
  @good.save
  end

  private
  def room_form_params
    params.require(:room_form).permit(:room_name, :concept, :category_id, :area_id, :tag_name).merge(user_id: current_user.id)
  end
  def propose_params
    params.permit(:title, :concept, :require_people).merge(user_id: current_user.id, room_id: @room.id)
  end
  # def good_params
  #   params.merge(propose_id: @propose.id, user_id: current_user.id)
  # end
  
 
  # def room_params
  #   params.require(:room).merge(user_id: current_user.id, room_id: params[:room_id])
  # end

end

