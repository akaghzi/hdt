class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :identifier, unique: true, index: true
      t.text :detail

      t.timestamps
    end
  end
end