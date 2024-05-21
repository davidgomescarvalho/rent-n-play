class AddFirstNameAndLastNameToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string, null: false, default: 'first_name'
    add_column :users, :last_name, :string, null: false, default: 'last_name'
  end
end
