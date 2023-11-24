class Purpose < ActiveHash::Base
  self.data = [
  { id: 1, name: '---' }, 
  { id: 2, name: '家で育てたい' },
  { id: 3, name: '実をつけたい' },
  ]
  
include ActiveHash::Associations
has_many :users
end