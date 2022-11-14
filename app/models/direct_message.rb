class DirectMessage < ApplicationRecord

  belongs_to :user
  belongs_to :direct_room

end
