class AddPeriodDateToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :period_date, :datetime
  end
end
