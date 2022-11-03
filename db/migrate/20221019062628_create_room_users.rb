class CreateRoomUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :room_users do |t|
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true

      t.index %i[ user_id room_id ], unique: true

      t.timestamps
    end
  end
end
