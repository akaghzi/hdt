class CreateTaskContractors < ActiveRecord::Migration
  def change
    create_table :task_contractors do |t|
      t.references :task, index: true
      t.references :contractor, index: true
      t.text :job_detail
      t.integer :price
      t.boolean :complete, default: false

      t.timestamps
    end
  end
end
