class Bookmark < ApplicationRecord
  validates :user_id, uniqueness: { scope: :chat_room_id }

  belongs_to :user
  belongs_to :chat_room
end
