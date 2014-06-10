class Item < ActiveRecord::Base
  
  validate :name, presense: true, uniqueness: {case_sensitive: false}
  
  before_save {|item|item.name=name.downcase}
  
end
