class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.date :date_complete
      t.date :date_due
      t.boolean :completed, default: false
      t.references :user, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
