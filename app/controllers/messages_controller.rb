class MessagesController < ApplicationController

  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.all
  end

   def show
     #@topic = Topic.find(params[:topic_id])
     #@message = @topic.messages.find(params[:id])
   end

  def new
    @message = Message.new
  end

  def edit
    # @topic = Topic.find(params[:topic_id])
    # @message = @topic.messages.find(params[:id])
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @message = @topic.messages.create(message_params)
    redirect_to topic_path(@topic)
  end

  def update
   respond_to do |format|
     if @message.update(message_params)
       format.html { redirect_to @message, notice: 'Message was successfully updated.' }
       format.json { render :show, status: :ok, location: @topic }
     else
       format.html { render :edit }
       format.json { render json: @message.errors, status: :unprocessable_entity }
     end
   end
  end

  def destroy
    # @topic = Topic.find(params[:topic_id])
    # @message = @topic.messages.find(params[:id])
    @message.destroy
    redirect_to topic_path(@topic)
  end

  private

  def message_params
    params.require(:message).permit(:title, :content)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = Message.find(params[:id])
  end


end
