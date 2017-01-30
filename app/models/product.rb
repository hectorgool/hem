class Product < ActiveRecord::Base
  
	validates :name, presence: true
  validates :description, presence: true

  # santo
  has_many :attachments, dependent: :destroy

  # santo
  accepts_nested_attributes_for :attachments, reject_if: :all_blank

  # santo
  belongs_to :user
  
  # santo
  paginates_per 12

  # santo
  validates :price, numericality: { greater_than: 0 }, :allow_nil => true

  # santo
  belongs_to :category

end
