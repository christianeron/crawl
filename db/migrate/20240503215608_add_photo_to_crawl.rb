class AddPhotoToCrawl < ActiveRecord::Migration[7.0]
  def change
    add_column :crawls, :photo, :string
  end
end
