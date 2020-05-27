class ShipDate < ActiveHash::Base
  include ActiveHash::Associations
  
  has_many :shippings
  self.data = [
    {id: 1, name: '選択してください'},
    {id: 2, name: '1日〜2日で発送'},
    {id: 3, name: '2日〜3日で発送'},
    {id: 4, name: '4日〜7日で発送'}
  ]
end
