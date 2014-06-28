class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.references :task, index: true
      t.references :store, index: true
      t.string :name
      t.string :description
      t.decimal :price, default: 1
      t.boolean :complete, default: false

      t.timestamps
    end
  end
end
