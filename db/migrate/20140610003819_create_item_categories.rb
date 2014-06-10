class CreateItemCategories < ActiveRecord::Migration
  def change
    create_table :item_categories do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
