class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :author_email, null: false
      t.string :title, null: false
      t.boolean :done, default: false
      t.timestamps null: false
    end
  end
end
