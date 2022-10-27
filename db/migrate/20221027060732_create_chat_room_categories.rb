class CreateChatRoomCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :chat_room_categories do |t|
      t.references :chat_room, null: false, foreign_key: true
      t.references :category,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
