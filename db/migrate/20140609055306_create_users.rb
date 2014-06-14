class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :store, index: true
      t.references :brand, index: true
      t.references :unit, index: true
      t.references :item_category, index: true
      t.string :first_name
      t.string :last_name
      t.boolean :admin
      t.boolean :approved

      t.timestamps
    end
  end
end