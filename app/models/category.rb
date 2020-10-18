class Category < ApplicationRecord
  has_many :items
  #'ancestry'はカテゴリ実装で
end
