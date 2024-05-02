class CreateVisits < ActiveRecord::Migration[7.0]
  def change
    create_table :visits do |t|
      t.integer :user_id
      t.integer :stop_id
      t.string :rating
      t.text :caption
      t.string :photo

      t.timestamps
    end
  end
end
