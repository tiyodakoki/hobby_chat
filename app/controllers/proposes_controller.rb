class ProposesController < ApplicationController
  def create
      
      @room = Room.find(params[:room_id])
      @propose = Propose.new(propose_params)
      
      if @propose.save
      redirect_to room_messages_path(@room.id)
      end
    end
  def destroy
  end
  def good
    @propose = Propose.find(params[:id])
    @good = Good.new(user_id: current_user.id, propose_id: @propose.id)
    @good.save
    end
    private
    def propose_params
      params.permit(:title, :concept, :require_people).merge(user_id: current_user.id, room_id: @room.id)
    end
end
