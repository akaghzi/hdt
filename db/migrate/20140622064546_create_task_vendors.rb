class CreateTaskVendors < ActiveRecord::Migration
  def change
    create_table :task_vendors do |t|
      t.references :task, index: true
      t.references :vendor, index: true
      t.text :job_detail
      t.integer :price

      t.timestamps
    end
  end
end
