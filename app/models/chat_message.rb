class ChatMessage < ApplicationRecord

  belongs_to :chat_room
  belongs_to :user
  has_one_attached :image, dependent: :destroy

  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

end
