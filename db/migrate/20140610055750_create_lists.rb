class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.references :user, index: true
      t.references :list_type, index: true
      t.references :item_category, index: true
      t.references :unit, index: true
      t.references :store, index: true
      t.references :brand, index: true
      t.string :name
      t.string :identifier
      t.decimal :price
      t.decimal :quantity
      t.boolean :favorite
      t.boolean :inbasket, default: false, index: true
      t.boolean :complete, default: false, index: true

      t.timestamps
    end
  end
end
