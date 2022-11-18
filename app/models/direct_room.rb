class DirectRoom < ApplicationRecord

  has_many :direct_room_users
  has_many :users, through: :direct_room_users
  has_many :direct_messages

  validates :subject, presence: true

end