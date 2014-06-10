class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, 
          :lockable, :timeoutable
          
  belongs_to :store
  
  def full_name
    "#{first_name} #{last_name}".titleize
  end
  
  def self.search(query)
    where(email: query.downcase)
  end
  
end
