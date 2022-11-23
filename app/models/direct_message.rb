class DirectMessage < ApplicationRecord

  belongs_to :user
  belongs_to :direct_room, optional: true
  has_one_attached :image, dependent: :destroy

  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

end
