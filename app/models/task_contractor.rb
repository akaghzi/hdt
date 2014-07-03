class TaskContractor < ActiveRecord::Base
  belongs_to :task
  belongs_to :contractor
  
  validates :task_id, :contractor_id, :job_detail, presence: true
  validates :contractor_id , uniqueness: {scope: :task}
  validates :price, presence: true, inclusion: {in: 1..50000}
  
  before_save {|task_contractor|task_contractor.job_detail = job_detail.downcase}
  
end
