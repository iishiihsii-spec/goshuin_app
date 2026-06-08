class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '神社' },
    { id: 3, name: 'お寺' }
  ]
  include ActiveHash::Associations
  has_many :goshuins
end