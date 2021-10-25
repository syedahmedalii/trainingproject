class Message < ApplicationRecord
    belongs_to :user, class_name: "user", foreign_key: "user_id"
    # belongs_to :room, class_name: "room", foreign_key: "room_id"
end
