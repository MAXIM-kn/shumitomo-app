class ChatRoomCategoryFrom
  include ActiveModel::Model
  attr_accessor :name, :introduction, :genre_id

  with_options presence: true do
    validates :name
    validates :introduction
    validates :genre_id
  end
  validates :genre_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    ChatRoom.create(name: name, introduction: introduction)
    Category.create(genre_id: genre_id)
  end
end