class CreateKingakus < ActiveRecord::Migration[5.2]
  def change
    create_table :kingakus do |t|
      t.integer :kingaku

      t.timestamps
    end
  end
end
