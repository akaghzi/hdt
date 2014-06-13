class List < ActiveRecord::Base
  belongs_to :user
  belongs_to :list_type
  belongs_to :item_category
  belongs_to :unit
  belongs_to :store
  belongs_to :brand
  
  validates :user_id, :list_type_id, :item_category_id, :unit_id, :store_id, :brand_id, :name, :quantity, presence: true
  validates :quantity, inclusion: {in: 0.1..10000}
  validates :price, allow_nil: true, inclusion: {in: 0.01..100000}, on: :create
  
  scope :basketed, -> {where(inbasket: true)}
  scope :unbasketed, -> {where(inbasket: false)}
  scope :completed, -> {where("inbasket is ? and complete = ? and updated_at <= ?", nil, true, Date.today+30.days)}

  before_save {|list|list.name=name.downcase}

  def self.search(query)
    where("name like ?","%#{query}%".downcase)
  end

end