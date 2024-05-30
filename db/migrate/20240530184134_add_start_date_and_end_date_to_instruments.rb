class AddStartDateAndEndDateToInstruments < ActiveRecord::Migration[7.1]
  def change
    add_column :instruments, :start_date, :date
    add_column :instruments, :end_date, :date
  end
end
