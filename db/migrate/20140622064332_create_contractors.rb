class CreateContractors < ActiveRecord::Migration
  def change
    create_table :contractors do |t|
      t.references :user, index: true
      t.string :name
      t.string :phone
      t.string :fax
      t.string :email
      t.string :description

      t.timestamps
    end
  end
end
