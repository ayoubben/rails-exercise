class ToggleTask
  include Interactor

  def call
    task = Task.find(context.id)
    context.fail! && return unless task
    context.fail! unless task.toggle_done!
  end
end
