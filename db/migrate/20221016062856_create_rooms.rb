class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :room_name,    null: false
      t.string :concept,      null: false
      t.integer :category_id, null: false
      t.integer :area_id,     null: false

      t.timestamps
    end
  end
end
