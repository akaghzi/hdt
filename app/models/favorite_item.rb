class FavoriteItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :item_category
  belongs_to :unit
  belongs_to :brand
  
  validates :user_id, :item_category_id, :unit_id, :brand_id, :store_id, :name, :quantity, presence: true
  validates :name, uniqueness: {case_sensitive: false, scope: :user}
  # validates :identifier, uniqueness: {case_sensitive: false, scope: :user}, if: :identifier
  validates :quantity, inclusion: {in: 0.1..10000}
  validates :price, inclusion: {in: 0.01..100000}
  
  before_save {|favorite_item|favorite_item.name=name.downcase}

  def self.search(query)
    where("name like ?","%#{query}%".downcase)
  end
  
  def self.tsearch(query)
    where("name like ?","#{query}%".downcase)
  end

end
