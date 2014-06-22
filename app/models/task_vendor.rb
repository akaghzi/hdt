class TaskVendor < ActiveRecord::Base
  belongs_to :task
  belongs_to :vendor
  
  validates :task_id, :vendor_id, :job_detail, presence: true
  validates :vendor_id , uniqueness: {scope: :task}
  validates :price, presence: true, inclusion: {in: 1..50000}
  
  before_save {|task_vendor|task_vendor.job_detail = job_detail.downcase}
  
end
