class ChatRoom < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  has_one_attached :image
  has_many :chat_room_users
  has_many :users, through: :chat_room_users
  has_many :categories

end
