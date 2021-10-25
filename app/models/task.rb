class Task < ApplicationRecord
    validates :title, presence: true, length: {minimum: 10}
    validates :description, presence: true, length: {minimum: 100}
    has_many :activities
    belongs_to :user
    has_many :reviewers
end
