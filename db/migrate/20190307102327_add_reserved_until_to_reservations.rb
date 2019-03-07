class AddReservedUntilToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :reserved_until, :datetime
  end
end
