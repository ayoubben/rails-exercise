Given(/^some tasks have been created$/) do
  step 'I go to the tasks page'

  10.times do
    @tasks_page.create_a_new_task(author_email: Faker::Internet.email,
                             title: Faker::Lorem.sentence)
  end
end

When(/^I go to the tasks page$/) do
  @tasks_page = TasksPage.new
  @tasks_page.load
end

Then(/^I should not see any tasks$/) do
  expect(@tasks_page.page).to have_content('You do not have any tasks yet. ' \
                                           'Start to fill in a new task ' \
                                           'title and hit enter.')
end

Then(/^I should see some tasks$/) do
  expect(@tasks_page.tasks.size).to eql(10)
end
