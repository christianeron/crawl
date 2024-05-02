class UpdateRatingInteger < ActiveRecord::Migration[7.0]
  def change
    remove_column :visits, :rating
    add_column :visits, :rating, :integer
  end
end
