class CreateKakakuTables < ActiveRecord::Migration[5.2]
  def change
    create_table :kakaku_tables do |t|
      t.string :hosoku
      t.intger :kingaku
	
      t.references :yoyaku_statuses, foreign_key: true

      t.timestamps
    end
  end
end
