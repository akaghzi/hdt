class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :identifier
      t.string :serving_unit
      t.integer :calories_per_serving
      t.boolean :alergy_alert
      t.string :alergen_description

      t.timestamps
    end
  end
end