class AddAvatarToOpinions < ActiveRecord::Migration
  def change
    add_column :opinions, :avatar, :string
  end
end
