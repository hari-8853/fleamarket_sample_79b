class Item < ApplicationRecord
  has_many :images
  has_many :category
  has_many :brand
  #belongs_to :seller, class_name: "User"
  #belongs_to :buyer, class_name: "User"
  
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :category_id, :item_condition_id, :postage_tyep_id, :preparation_day_id, :postege_payer_id, :images, presence: true
  validates :name,             presence: true, length: {maximum: 40 }
  validates :introduction,      presence: true, length: {maximum: 1000 }
  validates :price,            numericality: { only_integer:true, greater_than_or_equal_to:300, less_than: 99999999 }

  enum trading_status: {
    "販売中": 0,
    "売り切れ": 1
  }

end
