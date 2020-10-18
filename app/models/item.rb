class Item < ApplicationRecord
  has_many :images
  belongs_to :category
  belongs_to :brand
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"
  
  accepts_nested_attributes_for :images, allow_destroy: true
  
  validates :category, :item_condition, :postage_type, :Shipping_area, :preparation_day, presence: true
  validates :name,             presence: true, length: {maximum: 40 }
  validates :description,      presence: true, length: {maximum: 1000 }
  validates :price,            numericality: { only_integer:true, greater_than_or_equal_to:300, less_than: 99999999 }


end
