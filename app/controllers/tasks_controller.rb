class TasksController < ApplicationController
  before_action :fetch_tasks
  before_action :build_object, only: [:index, :create]

  def index; end

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
    @tasks = Task.all
  end

  def create_params
    params[:task].try(:permit, :title, :author_email)
  end

  def build_object
    @new_task = create_params ? CreateTask.call(create_params).task : Task.new
  end
end
