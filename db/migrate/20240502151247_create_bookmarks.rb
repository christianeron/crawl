class CreateBookmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmarks do |t|
      t.integer :user_id
      t.integer :crawl_id
      t.string :rating

      t.timestamps
    end
  end
end
