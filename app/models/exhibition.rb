class Exhibition < ActiveHash::Base
  self.data = [
    {id: 1, name: '売り切れ'},{id: 2, name: '出品中'},{id: 3, name: '出品停止'}
  ]
end