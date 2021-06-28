class UsersController < ApplicationController
skip_before_action :login_required, only: [:new, :create]

  def new
    redirect_to tasks_path if current_user
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to tasks_path
    else
      render :new
    end
  end

  def show
    redirect_to tasks_path,notice:"アクセスできません" unless current_user.id == params[:id].to_i
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:admin)
  end

end
