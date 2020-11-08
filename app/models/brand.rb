class Brand < ActiveHash::Base
  self.data = [
    {id: 1, name: 'シャネル'},
    {id: 2, name: 'デウス'},
    {id: 3, name: 'ナイキ'},
    {id: 4, name: 'ビラボン'},
    {id: 5, name: 'リップカール'},
    {id: 6, name: 'クイックシルバー'}
  ]
end
