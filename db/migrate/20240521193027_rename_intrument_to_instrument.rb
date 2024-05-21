class RenameIntrumentToInstrument < ActiveRecord::Migration[7.1]
  def change
    rename_table :intruments, :instruments
  end
end
