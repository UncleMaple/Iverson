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
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @message = @topic.messages.create(message_params)
    respond_to do |format|
      if @message.save
        format.html { redirect_to topic_path(@topic), notice: '添加message成功' }
        format.js
        format.json { render json: @message, status: :created, location: @topic }
      else
        @errors = @message.errors.full_messages
        # require "pry";binding.pry;
        format.html { redirect_to topic_path(@topic), notice: '添加message失败，请检查标题和内容是否正确' }
        format.js
        format.json { render json: @message.errors, status: :unprocessable_entity, location: @topic}
        # format.json { render json: @message.errors, status: :unprocessable_entity}
      end
    end
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
    @message.destroy
    redirect_to topic_path(@message.topic)
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
