class ChatRoom < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  has_one_attached :image, dependent: :destroy
  has_many :chat_room_users
  has_many :users, through: :chat_room_users, dependent: :destroy
  has_many :chat_messages
  belongs_to :category, dependent: :destroy
  
  validates :name,         presence: :true
  validates :introduction, presence: :true
  validates :genre_id    , presence: :true
  validates :genre_id, numericality: { other_than: 1, message: "can't be blank" }

end
