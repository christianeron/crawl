class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.integer :crawl_id
      t.integer :experience_id

      t.timestamps
    end
  end
end
