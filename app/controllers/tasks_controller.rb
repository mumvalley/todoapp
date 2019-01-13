class TasksController < ApplicationController

  # Todoタスク一覧を取得
  def index
    @tasks = Task.all
  end

  #タスク追加画面
  def new
    @task = Task.new
  end

  # タスクを追加する
  def create
    @task = Task.create(task_params)
    redirect_to tasks_path
  end

  # 編集画面
  def edit
    @task = Task.find(params[:id])
  end

  # 編集する時
  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path
  end

  # 削除
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private
    # ストロングパラメーター
    def task_params
      params.require(:task).permit(:title)
    end

end
