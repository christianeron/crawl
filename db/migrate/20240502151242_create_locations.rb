class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :street_address
      t.string :street_address_2
      t.string :city
      t.string :state
      t.string :zip_code

      t.timestamps
    end
  end
end
