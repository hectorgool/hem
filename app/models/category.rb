class Category < ActiveRecord::Base

  # santo
  validates :name, presence: true

  # santo
  has_many :products
  
end
