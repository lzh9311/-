class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email:params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # 登入用户，重定向的主页
      log_in user
      redirect_to root_path #暂时定向为根，最后调整为主页
    else
      #创建一个错误消息
      flash.now[:danger] = "邮箱或者密码不正确"
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
  
end
