class ChatRoomCategory < ApplicationRecord

  belongs_to :chat_rooms
  belongs_to :categories

end
