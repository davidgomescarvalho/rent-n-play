class AddUserIdToInstruments < ActiveRecord::Migration[7.1]
  def change
    add_reference :instruments, :user, null: false, foreign_key: true
  end
end
