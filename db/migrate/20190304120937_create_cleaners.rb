class CreateCleaners < ActiveRecord::Migration[5.2]
  def change
    create_table :cleaners do |t|
      t.string :name
      t.text :description
      t.float :average_rating
      t.integer :age
      t.integer :price

      t.timestamps
    end
  end
end
