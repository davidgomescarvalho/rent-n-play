class AddInstrumentIdToBookings < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookings, :instrument, null: false, foreign_key: true
  end
end
