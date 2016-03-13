class AddRemoteAvatarToOpinions < ActiveRecord::Migration
  def change
    add_column :opinions, :remote_avatar, :string
  end
end
