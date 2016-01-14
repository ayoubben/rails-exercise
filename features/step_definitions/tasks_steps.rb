Given(/^some tasks have been created$/) do
  step 'I go to the tasks page'

  5.times do
    @tasks_page.create_a_new_task(author_email: Faker::Internet.email,
                             title: Faker::Lorem.sentence)
  end
end

Given(/^the first task is done$/) do
  @tasks_page.tasks.first.click
end

When(/^I go to the tasks page$/) do
  @tasks_page = TasksPage.new
  @tasks_page.load
end

When(/^I create a new task$/) do
  @tasks_page.create_a_new_task(author_email: Faker::Internet.email,
                                title: Faker::Lorem.sentence)
end

When(/^I check the first task$/) do
  @tasks_page.tasks.first.click
end

Then(/^I should not see any tasks$/) do
  expect(@tasks_page.page).to have_content('You do not have any tasks yet. ' \
                                           'Start to fill in a new task ' \
                                           'title and hit enter.')
end

Then(/^I should see some tasks$/) do
  expect(@tasks_page.tasks.size).to eql(5)
end

Then(/^I should see a task$/) do
  expect(@tasks_page.tasks.size).to eql(1)
end

Then(/^the first task should be done$/) do
  expect(@tasks_page.tasks.first).to be_done
end

Then(/^the first task should be pending$/) do
  expect(@tasks_page.tasks.first).to_not be_done
end
