class ChangePhotoToPhotos < ActiveRecord::Migration[7.1]
  def change
    rename_column :instruments, :photo, :photos
  end
end
