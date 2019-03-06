class AddLocationToCleaners < ActiveRecord::Migration[5.2]
  def change
    add_column :cleaners, :address, :text
    add_column :cleaners, :latitude, :float
    add_column :cleaners, :longitude, :float
  end
end
