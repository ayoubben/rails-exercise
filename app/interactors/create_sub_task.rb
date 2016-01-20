class CreateSubTask
  include Interactor

  def call
    new_sub_task = SubTask.new(title: context.title, task_id: context.task_id)
    context.task = new_sub_task
    context.fail! unless new_sub_task.save
  end
end
