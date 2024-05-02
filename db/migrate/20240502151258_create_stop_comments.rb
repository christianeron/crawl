class CreateStopComments < ActiveRecord::Migration[7.0]
  def change
    create_table :stop_comments do |t|
      t.integer :stop_id
      t.integer :user_id
      t.text :comment

      t.timestamps
    end
  end
end
