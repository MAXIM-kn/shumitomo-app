class DirectRoom < ApplicationRecord

  has_many :direct_room_users, dependent: :destroy
  has_many :users, through: :direct_room_users
  has_many :direct_messages, dependent: :destroy

  validates :subject, presence: true

end
