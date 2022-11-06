class ChatRoomCategory
   include ActiveModel::Model
   attr_accessor :name, :introduction, :genre_id, :user_id, :image, :owner_id

   with_options presence: true do
    validates :name
    validates :introduction
    validates :genre_id
    validates :user_id
    validates :owner_id
   end
   validates :genre_id, numericality: { other_than: 1, message: "can't be blank" }

   def save
    category  = Category.create
    chat_room = ChatRoom.create(name: name, introduction: introduction, image: image, category_id: category.id, genre_id: genre_id, owner_id: owner_id )
    ChatRoomUser.create(chat_room_id: chat_room.id, user_id: user_id)
  end

  def update
    category  = Category.update
    chat_room = ChatRoom.update(name: name, introduction: introduction, image: image, category_id: category.id, genre_id: genre_id, owner_id: owner_id )
    ChatRoomUser.update(chat_room_id: chat_room.id, user_id: user_id)
  end
end