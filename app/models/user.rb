class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

  has_one_attached :image
  has_many :chat_room_users
  has_many :chat_rooms, through: :chat_room_users, source: :chat_room, foreign_key: :owner_id

  
end
