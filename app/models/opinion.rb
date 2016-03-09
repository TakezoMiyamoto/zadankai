class Opinion < ActiveRecord::Base
  belongs_to :user
  belongs_to :conference
  
  validates :user_id, :opinion_user, :body, presence: true
end
