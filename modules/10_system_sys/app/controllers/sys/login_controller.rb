class Sys::LoginController < ApplicationController

  skip_before_action :check_if_require_login, :only => [:login, :logout]

  layout 'login'

  def login
    if request.get?
      logout_auth
    else
      login_authentication
    end


  end

  def logout
    logout_auth

    render 'login'
  end


  private

  # 退出系统通用方法
  def logout_auth
    Sys::Session.clear_expired_sessions('30 minutes')

    Sys::User.current = nil
    #重置session,#注销用户
    reset_session
  end


  # 验证用户登录是否成功
  # 成功,则转向用户的默认页面
  # 失败,返回登录页面,并显示登录出错的消息
  def login_authentication
    username = params[:username].strip
    password = params[:password].strip
    begin
      raise '账号/密码不能为空' if username.blank? || password.blank?
      user, msg = Sys::User.try_login(username, password)

      if user
        # 登录成功
        successful_authentication(user)
      else
        #TODO 登录失败,记录错误日志
        params[:error] = msg
      end
    rescue Exception => e
      params[:error] = e.message.to_s
    end
  end

  # 登录成功则返回到默认页面
  def successful_authentication(user)
    # 设置当前登录用户
    Sys::User.current = user
    session[:user_id] = user.id

    #TODO 登录成功,记录日志

    #todo 登录成功后，根据请求url返回对应界面，不存在，则返回到默认页面
    redirect_to personal_info_path
  end


end
