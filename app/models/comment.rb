class Comment < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  
  validates :body,     length: { minimum: 1 }  
  
 
end
