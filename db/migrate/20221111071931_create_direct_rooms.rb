class CreateDirectRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :direct_rooms do |t|
      t.string :subject
      t.timestamps
    end
  end
end
