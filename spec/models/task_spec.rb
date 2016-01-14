require 'rails_helper'

describe Task, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:author_email) }
  end

  describe 'Class methods' do
    describe 'toggle_done!' do
      context 'with a pending Task' do
        it 'should mark it as done' do
          pending_task = Task.create!(author_email: 'sven@yellow.lu',
                                      title: 'Get my company in Yellow.lu')

          expect(pending_task.done).to be false

          pending_task.toggle_done!
          expect(pending_task.done).to be true
        end
      end
      context 'with a done Task' do
        it 'should mark it as pending' do
          pending_task = Task.create!(author_email: 'sven@yellow.lu',
                                      title: 'Get my company in Yellow.lu',
                                      done: true)

          pending_task.toggle_done!
          expect(pending_task.done).to be false
        end
      end
    end
  end
end
