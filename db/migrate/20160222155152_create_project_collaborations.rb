class CreateProjectCollaborations < ActiveRecord::Migration
  def change
    create_table :project_collaborations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true
      t.integer :role

      t.timestamps null: false
    end
  end
end
