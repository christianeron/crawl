class CreateStops < ActiveRecord::Migration[7.0]
  def change
    create_table :stops do |t|
      t.integer :crawl_id
      t.integer :order_number
      t.integer :location_id
      t.text :menu_recommendation

      t.timestamps
    end
  end
end
