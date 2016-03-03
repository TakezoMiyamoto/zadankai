class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name
      t.string :category
      t.string :main_image
      t.string :movie

      t.timestamps null: false
    end
  end
end
