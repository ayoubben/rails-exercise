class Task < ActiveRecord::Base
  # @nodoc ~~~ special behaviours ~~~

  # @nodoc ~~~ virtual attributes ~~~
  attr_accessor :check

  # @nodoc ~~~ callbacks ~~~

  # @nodoc ~~~ links ~~~
  belongs_to :user
  has_many :sub_tasks

  # @nodoc ~~~ validations ~~~
  validates :author_email, :title, presence: true

  # @nodoc ~~~ scopes ~~~

  # @nodoc ~~~ custom class methods ~~~

  # @nodoc ~~~ custom instance methods ~~~
  def toggle_done!
    toggle!(:done)
  end

  def status
    return self.done ? 'done' : 'pending'
  end

  def self.to_csv
    attributes = %w{id author_email title status full_name sub_task}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |task|
        csv << [task.id, task.author_email, task.title, task.status, task.user.full_name, task.sub_tasks.count]
      end
    end
  end
end
