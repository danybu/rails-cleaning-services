class AddPhotoUrlToCleaners < ActiveRecord::Migration[5.2]
  def change
    add_column :cleaners, :photo_url, :string
  end
end
