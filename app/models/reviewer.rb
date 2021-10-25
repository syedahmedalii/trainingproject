class Reviewer < ApplicationRecord
    has_many :tasks, class_name: "task", foreign_key: "admin_id"
    validates :admin_id, presence: true
    validates :child_id, presence: true
    validates :post_id, presence: true
end
