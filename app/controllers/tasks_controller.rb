class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :fetch_tasks
  before_action :build_object, only: [:index, :create]
  before_action :build_sub_object, only: [:index, :create]

  def index
    respond_to do |format|
      format.html
      format.csv { send_data Task.all.to_csv, filename: "Tasks-#{Date.today}.csv" }
    end
  end

  def create
    render action: :index
  end

  def toggle
    ToggleTask.call(id: params[:id])
    respond_to do |format|
      format.js
    end
  end

  private

  def fetch_tasks
    @tasks = current_user.tasks.paginate(:page => params[:page], :per_page => 5)
  end

  def create_params
    params[:task].try(:permit, :title, :author_email, :user_id)
  end

  def create_sub_params
    params[:sub_task].try(:permit, :title, :task_id, :task_id)
  end

  def build_object
    @new_task = create_params ? CreateTask.call(create_params).task : Task.new
  end

  def build_sub_object
    @new_sub_task = create_sub_params ? CreateSubTask.call(create_sub_params).task : SubTask.new
  end
end
