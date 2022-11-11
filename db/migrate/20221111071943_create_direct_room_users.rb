class CreateDirectRoomUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :direct_room_users do |t|
      t.references :user,        null: false, foreign_key: true
      t.references :direct_room, null: false, foreign_key: true
      t.timestamps
    end
  end
end
