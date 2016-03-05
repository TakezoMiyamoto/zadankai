class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  validates :user_id, presence: true
  validates :comment, presence: true, length: { maximum: 200 }
end
