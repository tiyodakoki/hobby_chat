class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.order(id: "DESC")

   
  end

  

  def create
    @room = Room.find(params[:room_id])
    # binding.pry
    message = @room.messages.new(message_params)

    if message.save
      # redirect_to action: :index
    render json: {message: message}
    end
    # if @message.save
    #   redirect_to action: :index
    # else
    #   render :index
    # end


end
private
def message_params
  params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
end


end