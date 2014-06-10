class List < ActiveRecord::Base
  belongs_to :user
  belongs_to :list_type
  belongs_to :item_category
  belongs_to :unit
  belongs_to :store
  belongs_to :brand
  
  validates :user_id, :list_type_id, :item_category_id, :unit_id, :store_id, :brand_id, :name, :quantity, presence: true
  
  def self.search(query)
    where("name like ?","%#{query}%".downcase)
  end
end
