class CreateTask
  include Interactor

  def call
    new_task = Task.new(author_email: context.author_email, title: context.title)
    context.task = new_task
    context.fail! unless new_task.save
  end
end
