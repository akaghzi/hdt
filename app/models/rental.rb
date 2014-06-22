class Rental < ActiveRecord::Base
  belongs_to :task
  belongs_to :store
  
  validates :task_id, :store_id, :name, :price, presence: true
  validates :name, uniqueness: {case_senstive: false, scope: :task}
  
end
