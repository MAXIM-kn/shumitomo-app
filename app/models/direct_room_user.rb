class DirectRoomUser < ApplicationRecord

  belongs_to :direct_room, optional: true
  belongs_to :user, optional: true

end
