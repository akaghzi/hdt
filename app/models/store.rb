class Store < ActiveRecord::Base
  has_many :users
  has_many :lists
  
  validates :name, presence: true, uniqueness: {case_sensitive: false}

  before_save {|store|store.name=name.downcase}
  
  def self.search(query)
    where("name like ?","%#{query}%".downcase)
  end
end
