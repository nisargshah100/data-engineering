class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :description
      t.decimal :price, :precision => 8, :scale => 2 

      t.timestamps
    end
  end
end
