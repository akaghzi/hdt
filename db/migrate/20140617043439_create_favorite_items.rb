class CreateFavoriteItems < ActiveRecord::Migration
  def change
    create_table :favorite_items do |t|
      t.references :user, index: true
      t.references :item_category, index: true
      t.references :unit, index: true
      t.references :store, index: true
      t.references :brand, index: true
      t.string :name
      t.string :identifier
      t.decimal :price
      t.decimal :quantity
      t.date :imported_at

      t.timestamps
    end
  end
end
