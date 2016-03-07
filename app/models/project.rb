class Project < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :conferences
  validates :project_name, :category, presence: true
  mount_uploader :main_image, ImageUploader
  mount_uploader :movie, MovieUploader

end
