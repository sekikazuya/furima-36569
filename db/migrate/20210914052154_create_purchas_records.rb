class CreatePurchasRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :purchas_records do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.timestamps
    end
  end
end
