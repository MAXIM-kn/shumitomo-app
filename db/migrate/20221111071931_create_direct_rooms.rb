class CreateDirectRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :direct_rooms do |t|
      t.string :subject
      t.references :owner, foreign_key: { to_table: 'users' }
      t.references :another, foreign_key: { to_table: 'users' }
      t.timestamps
    end
  end
end
