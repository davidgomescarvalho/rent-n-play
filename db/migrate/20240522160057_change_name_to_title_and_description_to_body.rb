class ChangeNameToTitleAndDescriptionToBody < ActiveRecord::Migration[7.1]
  def change
    change_table :instruments do |t|
      t.rename :name, :title
      t.rename :description, :body
    end
  end
end
