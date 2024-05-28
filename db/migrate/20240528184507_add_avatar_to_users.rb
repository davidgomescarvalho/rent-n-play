class AddAvatarToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :avatar, :string, null: false
  end
end
