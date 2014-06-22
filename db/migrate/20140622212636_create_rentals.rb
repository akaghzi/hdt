class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.references :task, index: true
      t.references :store, index: true
      t.string :name
      t.string :description
      t.string :price
      t.boolean :complete

      t.timestamps
    end
  end
end
