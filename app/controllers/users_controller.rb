class UsersController < ApplicationController
  before_action :logged_in_user,only:[:index,:edit,:update]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      # 处理注册成功情况
      flash[:success] = "哎呦，不错哦，注册成功了"
      redirect_to root_path
    else
      render "new"
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # 处理更新成功的情况
      flash[:success] = "资料更新成功"
      redirect_to @user
    else
     render 'edit'  
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "删除成功"
    redirect_to users_url
  end
  
  def following
    @title = "关注"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end
  
    def followers
    @title = "粉丝"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  private
    def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end
   
    # 确保是正确的用户
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
    #确保是管理员
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
