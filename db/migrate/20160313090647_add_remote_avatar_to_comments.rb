class AddRemoteAvatarToComments < ActiveRecord::Migration
  def change
    add_column :comments, :remote_avatar, :string
  end
end
