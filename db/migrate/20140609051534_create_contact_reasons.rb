class CreateContactReasons < ActiveRecord::Migration
  def change
    create_table :contact_reasons do |t|
      t.string :name

      t.timestamps
    end
  end
end
