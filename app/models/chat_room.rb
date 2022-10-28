class ChatRoom < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  has_many :chat_room_users
  has_many :categories, through: :chat_room_categories

end
