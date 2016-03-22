class AddBrandNameToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :brand_name, :string
  end
end
