class CreateCrawls < ActiveRecord::Migration[7.0]
  def change
    create_table :crawls do |t|
      t.string :name
      t.integer :category_id
      t.string :city
      t.string :state
      t.integer :user_id

      t.timestamps
    end
  end
end
