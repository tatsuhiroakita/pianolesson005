class CreateNyukinRirekis < ActiveRecord::Migration[5.2]
  def change
    create_table :nyukin_rirekis do |t|
      t.datetime :itu
      t.integer :kingaku

      t.references :nyukin_shubetsus, foreign_key: true
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
