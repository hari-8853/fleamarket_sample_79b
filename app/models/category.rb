class Category < ActiveHash::Base
  self.data = [
    {id: 1, name: 'シャネル'},
    {id: 2, name: 'プラダ'}
  ]
end


#class Category < ApplicationRecord
 # has_many :items
  #'ancestry'ha

#end
