class Project < ActiveRecord::Base
  belongs_to :user
  mount_uploader :main_image, ImageUploader
end
