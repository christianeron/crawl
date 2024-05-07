class AddPhotoUrlToVisits < ActiveRecord::Migration[7.0]
  def change
    add_column :visits, :photo_url, :string
  end
end
