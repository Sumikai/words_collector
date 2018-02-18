class Word < ApplicationRecord
  validates :content, presence: true
  validates :content, length: { in: 1..35 }
  
  #アソシエーション
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  validates :user_id, presence: true
  
  default_scope -> { order(created_at: :desc) }
  
  #検索機能
  def self.search(search)
    if search
      Word.where(['content LIKE ?', "%#{search}%"])
    else
      Word.limit(7)
    end
  end
  
  #タグ機能
  acts_as_taggable
  
end
