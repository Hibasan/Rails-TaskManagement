class Admin::UsersController < ApplicationController
  before_action :admin_required
  def admin_required
    redirect_to tasks_path,notice:"管理者以外はアクセスできません" unless current_user.admin
  end

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path,notice:"ユーザーを編集しました"
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path,notice:"ユーザーを削除しました"
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:admin)
  end

end
