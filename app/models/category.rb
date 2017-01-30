class Category < ActiveRecord::Base

  # santo
  validates :name, presence: true

  # santo
  has_and_belongs_to_many :products
  
end
