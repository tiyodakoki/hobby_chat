class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'ボードゲーム' },
    { id: 3, name: 'デジタルゲーム' },
    { id: 4, name: 'コミック' },
    { id: 5, name: '映画' },
    { id: 6, name: 'スポーツ' },
    { id: 7, name: 'ギャンブル' },
    { id: 8, name: 'その他' },

  ]

  include ActiveHash::Associations
  has_many :rooms
end
