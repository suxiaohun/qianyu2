class Sys::UsersController < ApplicationController
  before_action :set_sys_user, only: [:show, :edit, :update, :destroy]



  # 个人信息页
  def personal_info

    @user = Sys::User.find(session[:user_id])

  end


  # GET /sys/users
  def index
    @sys_users = Sys::User.all
  end

  # GET /sys/users/1
  def show
  end

  # GET /sys/users/new
  def new
    @sys_user = Sys::User.new
  end

  # GET /sys/users/1/edit
  def edit
  end

  # POST /sys/users
  def create
    @sys_user = Sys::User.new(sys_user_params)

    if @sys_user.save
      redirect_to @sys_user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sys/users/1
  def update
    if @sys_user.update(sys_user_params)
      redirect_to @sys_user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sys/users/1
  def destroy
    @sys_user.destroy
    redirect_to sys_users_url, notice: 'User was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_sys_user
    @sys_user = Sys::User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def sys_user_params
    params.require(:sys_user).permit(:login_name, :name)
  end
end
