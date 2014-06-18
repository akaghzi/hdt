class Task < ActiveRecord::Base
  belongs_to :user
  
  validates :name, :target_date, :detail, presence: true
  validate :check_target_date
  
  scope :incomplete, -> {where(complete: false)}
  scope :completed, -> {where(complete: true)}
  
  before_save {|tasks|tasks.name=name.downcase}
  
  def check_target_date
    if target_date.present? && target_date < Date.today
      errors.add(:target_date, "can't be in the past")
    end
    
  end
  
  def self.search(query)
    where("name like ?","%#{query}%".downcase)
  end
  
end
