module CurrentUser

  private

  # 找不到该用户id则新建一个用户为该id
  def set_user
    @user = session[:current_user_id]
  # rescue ActiveRecord::RecordNotFound
  #   @user = User.create
  #   session[:user_id] = @user.id
  end
end