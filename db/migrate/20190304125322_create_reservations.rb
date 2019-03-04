class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.datetime :reserved_on
      t.string :status
      t.references :user, foreign_key: true
      t.references :review, foreign_key: true
      t.references :cleaner, foreign_key: true

      t.timestamps
    end
  end
end
