class ChatRoom < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  has_one_attached :image
  has_many :chat_room_users
  has_many :users, through: :chat_room_users
  belongs_to :category
  
  validates :name,         presence: :true
  validates :introduction, presence: :true
  validates :genre_id    , presence: :true
  validates :genre_id, numericality: { other_than: 1, message: "can't be blank" }

end
