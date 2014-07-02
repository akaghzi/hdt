class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :ContactReason, index: true
      t.references :user, index: true
      t.string :title
      t.text :details

      t.timestamps
    end
  end
end
