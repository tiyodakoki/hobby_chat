class CreateGoods < ActiveRecord::Migration[6.0]
  def change
    create_table :goods do |t|
      t.references :user, foreign_key: true
      t.references :propose, foreign_key: true

      t.timestamps
    end
  end
end
