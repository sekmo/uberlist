class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :content, null: false
      t.integer :project_id, null: false
      t.boolean :completed, default: false
      t.index :project_id
      t.timestamps
    end
  end
end
