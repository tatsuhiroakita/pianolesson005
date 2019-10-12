class CreateYoyakus < ActiveRecord::Migration[5.2]
  def change
    create_table :yoyakus do |t|     
      t.datetime :start_time
      t.datetime :end_time
      t.string :name
      t.text :description
      
      t.references :yoyaku_statuses, foreign_key: true
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
