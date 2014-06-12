class ItemCategory < ActiveRecord::Base
  has_many :lists
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :description, presence: true
  
  before_save {|item_category|item_category.name=name.downcase}
  before_save {|item_category|item_category.description=description.downcase}
  
  def self.search(query)
    where("name like ?","%#{query}%".downcase)
  end
  
end
