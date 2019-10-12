class CreateYoyakuStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :yoyaku_statuses do |t|
      t.integer	:status
      t.string  :name

      t.timestamps
    end
  end
end
