class SubscribesController < ApplicationController

  ## 新建订阅前先设置用户id（找不到user_id即新建user）
  # include CurrentUser
  # before_action :set_user, only: [:create]

  before_action :set_subscribe, only: [:show, :edit, :update, :destroy]

  # GET /subscribes
  # GET /subscribes.json
  def index
    @subscribes = Subscribe.all
  end

  # GET /subscribes/1
  # GET /subscribes/1.json
  def show
  end

  # GET /subscribes/new
  def new
    @subscribe = Subscribe.new
  end

  # GET /subscribes/1/edit
  def edit
  end

  # POST /subscribes
  # POST /subscribes.json
  def create
    topic = Topic.find(params[:topic_id])
    # test 每次订阅 都加到 user_id 为1的用户
    # @user = User.find(1)
    set_user
    @subscribe = @user.subscribes.build(topic: topic)

    respond_to do |format|
      if @subscribe.save
        ## 这里跳到了users show界面
        format.html { redirect_to @subscribe.user, notice: '添加订阅成功' }
        format.json { render :show, status: :created, location: @subscribe }
      else
        format.html { render :new }
        format.json { render json: @subscribe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subscribes/1
  # PATCH/PUT /subscribes/1.json
  def update
    respond_to do |format|
      if @subscribe.update(subscribe_params)
        format.html { redirect_to @subscribe, notice: 'Subscribe was successfully updated.' }
        format.json { render :show, status: :ok, location: @subscribe }
      else
        format.html { render :edit }
        format.json { render json: @subscribe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscribes/1
  # DELETE /subscribes/1.json
  def destroy
    @subscribe.destroy
    respond_to do |format|
      # format.html { redirect_to subscribes_url, notice: 'Subscribe was successfully destroyed.' }
      format.html { redirect_to @subscribe.user, notice: '取消订阅成功' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscribe
      @subscribe = Subscribe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscribe_params
      params.require(:subscribe).permit(:topic_id, :user_id)
      # params.require(:subscribe).permit(:is_mail, :is_message, :topic_id, :user_id)
    end

    def set_user
      @user = User.find(session[:current_user_id])
    end
end
