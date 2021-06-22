class TasksController < ApplicationController

  def index
    case params[:sort]
    when "search" then
      if params[:title].blank?
        @task = Task.where(status: "#{params[:status]}")
      elsif params[:status].blank?
        @task = Task.where("title LIKE ?","%#{params[:title]}%")
      else
        @task = Task.where("title LIKE ?","%#{params[:title]}%").where(status: "#{params[:status]}")
      end
    when "limit" then
      @task = Task.order(limit: :desc)
    when "create" then
      @task = Task.order(created_at: :desc)
    else
      @task = Task.all
    end
  end





  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path,notice:"タスクを追加しました"
    else
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to root_path,notice:"タスクを編集しました"
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path,notice:"タスクを削除しました"
  end

  private
  def task_params
    params.require(:task).permit(:title,:content,:limit,:status,:priority)
  end
end
