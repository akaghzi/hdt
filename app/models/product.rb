class Product < ActiveRecord::Base
  
  validates :identifier, presence: true, uniqueness: {case_sensitive: false, message: "UPC  already taken"} 
  
  def self.search(query)
    where("identifier like ?","%#{query}%".downcase)
  end
  
end