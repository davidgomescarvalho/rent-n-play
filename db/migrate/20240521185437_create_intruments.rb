class CreateIntruments < ActiveRecord::Migration[7.1]
  def change
    create_table :intruments do |t|
      t.string :name
      t.text :description
      t.string :category
      t.integer :price
      t.string :photo

      t.timestamps
    end
  end
end
