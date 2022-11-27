class DirectMessage < ApplicationRecord

  belongs_to :user
  belongs_to :direct_room, optional: true
  has_one_attached :image, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

  def create_notification_direct_message!(current_user, direct_message_id)
    temp_ids = DirectMessage.select(:user_id).where(direct_room_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_direct_message!(current_user, direct_message_id, temp_id['user_id'])
    end
    save_notification_direct_message!(current_user, direct_message_id, user_id) if temp_ids.blank?
  end

  def save_notification_direct_message!(current_user, direct_message_id, visited_id)
    notification = current_user.active_notifications.new(
      direct_room_id: id,
      direct_message_id: direct_message_id,
      visited_id: visited_id,
      action: 'direct_message'
    )
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
  
end
