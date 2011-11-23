class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :purchaser_id
      t.integer :merchant_id
      t.integer :deal_id
      t.integer :purchase_count

      t.timestamps
    end
  end
end
