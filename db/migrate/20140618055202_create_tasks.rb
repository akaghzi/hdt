class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :user, index: true
      t.string :name
      t.text :detail
      t.date :target_date
      t.decimal :material_cost, default: 0
      t.decimal :rental_cost, default: 0
      t.decimal :labor_cost, default: 0
      t.boolean :complete, default: false

      t.timestamps
    end
  end
end
