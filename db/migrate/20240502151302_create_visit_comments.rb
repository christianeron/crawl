class CreateVisitComments < ActiveRecord::Migration[7.0]
  def change
    create_table :visit_comments do |t|
      t.integer :user_id
      t.integer :visit_id
      t.text :comment

      t.timestamps
    end
  end
end
