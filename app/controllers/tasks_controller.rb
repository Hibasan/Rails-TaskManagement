class TasksController < ApplicationController

  def index
      @task = Task.page(params[:page]).per(5)
    case params[:sort]
    when "search" then
      if params[:title].blank?
        @task = @task.search_status(params[:status])
      elsif params[:status].blank?
        @task = @task.search_title(params[:title])
      else
        @task = @task.search_title(params[:title]).search_status(params[:status])
      end
    when "limit" then
      @task = @task.order(limit: :desc)
    when "create" then
      @task = @task.order(created_at: :desc)
    when "priority" then
      @task = @task.order(priority: :desc)
    else

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
