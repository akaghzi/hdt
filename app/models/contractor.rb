class Contractor < ActiveRecord::Base
  belongs_to :user
  
  validates :name, :phone, :email, :description, presence: true, uniqueness: {case_sensitive: false, scope: :user}

  before_save {|contractor|contractor.name=name.downcase}
  before_save {|contractor|contractor.email=email.downcase}
  before_save {|contractor|contractor.description=description.downcase}
  
  def self.search(query)
    where("name like ?","%#{query}%".downcase)
  end
  
end
