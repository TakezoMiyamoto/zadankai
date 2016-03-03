class Project < ActiveRecord::Base
  belongs_to :user
  validates :project_name, :category, presence: true
  mount_uploader :main_image, ImageUploader
  mount_uploader :movie, MovieUploader

end
