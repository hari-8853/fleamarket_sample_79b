class PostageTyep < ActiveHash::Base
  self.data = [
    {id: 1, name: 'ゆうパック'},
    {id: 2, name: 'その他'}
  ]
end