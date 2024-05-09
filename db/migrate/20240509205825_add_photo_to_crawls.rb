class AddPhotoToCrawls < ActiveRecord::Migration[7.0]
  def change
    remove_column :crawls, :photo
    add_column :crawls, :photo, :string

  end
end
