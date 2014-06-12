class Item < ActiveRecord::Base
  
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  
  before_save {|item|item.name=name.downcase}
  
  def self.search(query)
    where("name like ?","%#{query}%".downcase)
  end
  
end
