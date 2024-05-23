class AddLocationAndAvailabilityToInstruments < ActiveRecord::Migration[7.1]
  def change
    add_column :instruments, :location, :string, null: false
    add_column :instruments, :availability, :string, null: false
  end
end
