class Deliveryday < ActiveHash::Base
  validates :id, presence: true
  self.data = [
    {id: 1, name: '選択がありません'},{id: 2, name: '1〜2日で発送'},{id: 3, name: '2〜3日で発送'},{id: 4, name: '4〜7日で発送'}
  ]
end