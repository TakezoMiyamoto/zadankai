class AddAimMoneyToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :aim_money, :integer
  end
end
