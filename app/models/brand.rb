class Brand < ActiveRecord::Base
  has_many :lists
  
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  
  before_save {|brand|brand.name = name.downcase}

  def self.search(query)
    where("name like ?","%#{query}%".downcase)
  end
  
end