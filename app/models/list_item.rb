class ListItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :list_type
  belongs_to :item_category
  belongs_to :unit
  belongs_to :store
  belongs_to :brand
  belongs_to :task
  belongs_to :fd_group, class_name: "FdGroup", primary_key: "fdgrp_cd", foreign_key: "fdgrp_cd"
  has_many :fd_descs, class_name: "FdDesc", primary_key: "ndb_no", foreign_key: "ndb_no"
  
  validates :user_id, :list_type_id, :item_category_id, :unit_id, :store_id, :brand_id, :name, :quantity, presence: true
  validates :quantity, inclusion: {in: 0.1..10000}
  validates :price, allow_nil: true, inclusion: {in: 0.01..100000}, on: :create
  
  scope :basketed, -> {where(inbasket: true)}
  scope :unbasketed, -> {where(inbasket: false)}
  scope :completed, -> {where("inbasket is ? and complete = ? and updated_at <= ?", nil, true, Date.today+30.days)}
  scope :food, ->{completed.where("ndb_no is not null")}

  before_save {|list_item|list_item.name=name.downcase}

  def self.search(query)
    where("name like ?","%#{query}%".downcase)
  end

end