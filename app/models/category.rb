class Category < ApplicationRecord
  
  has_many :chat_rooms, through: :chat_room_categories
  
end
