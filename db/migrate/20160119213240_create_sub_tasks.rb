class CreateSubTasks < ActiveRecord::Migration
  def change
    create_table :sub_tasks do |t|
      t.string :title, null: false
      t.boolean :done, default: false
      t.integer :task_id

      t.timestamps
    end
  end
end
