class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :user, index: true, foreign_key: true

      t.text :project_name
      t.text :category
      t.text :main_image
      t.text :movie
      
      t.timestamps null: false
      t.index [:user_id, :created_at]
    end
  end
end
