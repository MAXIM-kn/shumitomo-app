class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
                
  has_one_attached :image
  has_many :chat_room_users
  has_many :chat_rooms, through: :chat_room_users
  has_many :chat_messages
  has_many :direct_room_users
  has_many :direct_rooms, through: :direct_room_users
  has_many :direct_messages

  validates :nickname, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, on: :create

end
