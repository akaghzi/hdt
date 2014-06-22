class TaskVendor < ActiveRecord::Base
  belongs_to :task
  belongs_to :vendor
  
  validates :task_id, :vendor_id, presence: true
  validates :price, presence: true, inclusion: {in: 1..50000}
  
end
