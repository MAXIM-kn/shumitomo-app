class ChatRoom < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  has_one_attached :image, dependent: :destroy
  has_many :chat_room_users, dependent: :destroy
  has_many :users, through: :chat_room_users
  has_many :chat_messages, dependent: :destroy
  belongs_to :category, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :users_like, class_name: 'User', through: :likes
  has_many :notifications, dependent: :destroy
  
  validates :name,         presence: :true
  validates :introduction, presence: :true
  validates :genre_id    , presence: :true
  validates :genre_id, numericality: { other_than: 1 , message: "が選択されていません" }

  def self.search(search)
    if search != ""
      ChatRoom.where('name LIKE(?)', "%#{search}%")
    else
      @chat_rooms = ChatRoom.where(genre_id: params[:category_id])
    end
  end

  def liked?(user)
    likes.where(user_id: user.id).exists?
  end

  def create_notification_like!(current_user, user_id)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and chat_room_id = ? and action = ? ", current_user, user_id, id, 'like'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        chat_room_id: id,
        visited_id: user_id,
        action: 'like'
      )
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

end
