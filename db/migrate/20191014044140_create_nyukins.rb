class CreateNyukins < ActiveRecord::Migration[5.2]
  def change
    create_table :nyukins do |t|
      t.integer :zandaka
      t.integer :yoyakukin

      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
