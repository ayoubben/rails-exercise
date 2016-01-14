class Task < ActiveRecord::Base
  # @nodoc ~~~ special behaviours ~~~

  # @nodoc ~~~ virtual attributes ~~~
  attr_accessor :check

  # @nodoc ~~~ callbacks ~~~

  # @nodoc ~~~ links ~~~

  # @nodoc ~~~ validations ~~~
  validates :author_email, :title, presence: true

  # @nodoc ~~~ scopes ~~~

  # @nodoc ~~~ custom class methods ~~~

  # @nodoc ~~~ custom instance methods ~~~
  def toggle_done!
    toggle!(:done)
  end
end
