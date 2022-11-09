class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.order(id: "DESC")
    @propose = Propose.new
    @proposes = @room.proposes.order(id: "DESC")
    @good = Good.find(params[:room_id])
    @goods = @propose.goods.order(id: "DESC")
    binding.pry

  
    

    

   
  end


  

  def create
    @room = Room.find(params[:room_id])
    
   
    message = @room.messages.new(message_params)
   


    if message.save
      # redirect_to action: :index
      
    render json: {message: message}
    # render json: {sender: sender}
    end
    # if @message.save
    #   redirect_to action: :index
    # else
    #   render :index
    # end


end

private
def message_params
  params.require(:message).permit(:content).merge(user_id: current_user.id)
end





end
