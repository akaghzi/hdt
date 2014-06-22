class Vendor < ActiveRecord::Base
  belongs_to :user
  
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :phone, :email, :description, presence: {case_sensitive: false, scope: :user}

  before_save {|vendor|vendor.name=name.downcase}
  before_save {|vendor|vendor.email=email.downcase}
  before_save {|vendor|vendor.description=description.downcase}
  
  def self.search(query)
    where("name like ?","%#{query}%".downcase)
  end
  
end
