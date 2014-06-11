class Brand < ActiveRecord::Base
  def self.search(query)
    where("name like ?","%#{query}%".downcase)
  end
end
