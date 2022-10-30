class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'スポーツ' },
    { id: 3, name: 'ゲーム' },
    { id: 4, name: '料理' },
    { id: 5, name: 'アウトドア' },
    { id: 6, name: '音楽' },
    { id: 7, name: 'ペット' },
    { id: 8, name: '友達' },
  ]

  include ActiveHash::Associations
  has_many :chat_rooms

  end