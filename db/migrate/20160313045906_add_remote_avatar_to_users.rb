class AddRemoteAvatarToUsers < ActiveRecord::Migration
  def change
    add_column :users, :remote_avatar, :string
  end
end
