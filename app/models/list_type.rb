class ListType < ActiveRecord::Base
  
  validates :name, :description, presence: true
  validates :name, uniqueness: {case_sensitive: false}
  
  before_save {|list_type|list_type.name = name.titleize}
  before_save {|list_type|list_type.description = description.titleize}
end