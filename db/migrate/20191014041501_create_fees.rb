class CreateFees < ActiveRecord::Migration[5.2]
  def change
    create_table :fees do |t|
      t.integer :level
      t.integer :style
      t.string :hosoku
      t.integer :kingaku

      t.timestamps
    end
  end
end
