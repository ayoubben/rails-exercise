class TaskSection < SitePrism::Section
  element :id, 'td.id'
  element :toggle, 'td.toggle'
  element :author_email, 'td.author_email'
  element :title, 'td.title'
end

class TasksPage < SitePrism::Page
  set_url '/tasks'

  element :new_task_author_email, "input[id='task_author_email']"
  element :new_task_title, "input[id='task_title']"
  element :plus_button, "input[type='submit']"

  sections :tasks, TaskSection, "#tasks table tbody tr"

  def create_a_new_task(params)
    new_task_author_email.set params[:author_email]
    new_task_title.set params[:title]
    plus_button.click
  end
end
