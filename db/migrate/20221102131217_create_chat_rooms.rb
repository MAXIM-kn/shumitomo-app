class CreateChatRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :chat_rooms do |t|
      t.string :name,         null: false
      t.text   :introduction, null: false
      t.integer    :genre_id, null: false
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
