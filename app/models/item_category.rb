class ItemCategory < ActiveRecord::Base
  
  validates :name, :description, presence: true, uniqueness: {case_sensitive: false}
  
  before_save {|item_category|item_category.name=name.downcase}
  before_save {|item_category|item_category.description=description.downcase}
end
