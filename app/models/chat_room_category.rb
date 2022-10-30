class ChatRoomCategory
   include ActiveModel::Model
   attr_accessor :name, :introduction, :genre_id, :user_id, :image

   with_options presence: true do
    validates :name
    validates :introduction
    validates :genre_id
    validates :user_id
   end
   validates :genre_id, numericality: { other_than: 1, message: "can't be blank" }

   def save
     category  = Category.create(genre_id: genre_id)
     chat_room = ChatRoom.create(name: name, introduction: introduction, image: image)
     ChatRoomUser.create(chat_room_id: chat_room.id, user_id: user_id)
   end
end