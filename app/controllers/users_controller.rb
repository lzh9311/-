class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      # 处理注册成功情况
      flash[:success] = "哎呦，不错哦，注册成功了"
      redirect_to root_path
    else
      render "new"
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end
end
