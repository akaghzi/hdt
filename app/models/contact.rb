class Contact < ActiveRecord::Base
  belongs_to :ContactReason
  belongs_to :user
  
  validates :user_id, :title, :details, presence: true
  
  before_save {|contact|contact.title = title.downcase}
  before_save {|contact|contact.details = details.downcase}

  def self.search(query)
    where("title like ?","%#{query}%".downcase)
  end
end
