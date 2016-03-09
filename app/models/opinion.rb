class Opinion < ActiveRecord::Base
  belongs_to :user
  belongs_to :conference
  
  validates :opinion_user, :body, presence: true
end