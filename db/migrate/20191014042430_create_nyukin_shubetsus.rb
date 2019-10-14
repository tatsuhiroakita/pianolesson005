class CreateNyukinShubetsus < ActiveRecord::Migration[5.2]
  def change
    create_table :nyukin_shubetsus do |t|
      t.string :shubetu

      t.timestamps
    end
  end
end
