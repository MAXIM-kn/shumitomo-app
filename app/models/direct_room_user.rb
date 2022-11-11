class DirectRoomUser < ApplicationRecord

  belongs_to :direct_room
  belongs_to :user

end
