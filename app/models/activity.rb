class Activity < ApplicationRecord
  belongs_to :task
  validates :body, presence: true
  
  
end
