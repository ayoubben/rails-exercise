require 'rails_helper'

describe TasksController, type: :controller do
  describe 'Routing' do
    it { should route(:get, '/tasks').to(controller: :tasks, action: :index) }
    it { should_not route(:get, '/tasks/new').
          to(controller: :tasks, action: :new) }
    it { should route(:post, '/tasks').
          to(controller: :tasks, action: :create) }
    it { should_not route(:get, '/tasks/1').
          to(controller: :tasks, action: :show) }
    it { should_not route(:get, '/tasks/1/edit').
          to(controller: :tasks, action: :edit) }
    it { should_not route(:patch, '/tasks/1').
          to(controller: :tasks, action: :update) }
    it { should_not route(:delete, '/tasks/1').
          to(controller: :tasks, action: :destroy) }
    it { should route(:patch, '/tasks/1/toggle').
          to(controller: :tasks, action: :toggle, id: '1') }
  end

  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'loads all of the tasks into @tasks' do
      task1 = Task.create!(author_email: 'steve@yellow.lu',
                           title: 'Apprendre à utiliser Docker')
      task2 = Task.create!(author_email: 'mireille@yellow.lu',
                           title: 'Rendre visite à Mustafa')

      get :index

      expect(assigns(:tasks)).to match_array([task1, task2])
    end
  end
end
