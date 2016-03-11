class Project < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :conferences
  
  #relationships
  has_many :joining_relationships, class_name:  "Relationship",
                                    foreign_key: "joined_project_id",
                                    dependent:   :destroy
  has_many :joiner_users, through: :joining_relationships, source: :joiner_user
  
  validates :project_name, :category, presence: true
  mount_uploader :main_image, ImageUploader
  mount_uploader :movie, MovieUploader

end
