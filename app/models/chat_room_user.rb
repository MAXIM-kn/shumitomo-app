class ChatRoomUser < ApplicationRecord

  belongs_to :chat_room, dependent: :destroy
  belongs_to :user

end
