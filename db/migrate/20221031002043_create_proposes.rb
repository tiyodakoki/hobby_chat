class CreateProposes < ActiveRecord::Migration[6.0]
  def change
    create_table :proposes do |t|
      t.string :title, null: false
      t.string :concept, null: false
      t.integer :require_people
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
