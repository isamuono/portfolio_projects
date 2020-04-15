class Community < ApplicationRecord
  validates :communityName, presence: true, uniqueness: true
  validates :category, presence: true
  validates :subcategory, presence: false
  validates :prefecture, presence: true
  validates :sex, presence: false
  validates :scale, presence: false
  validates :image, presence: false
  validates :description, length: { maximum: 255 }
  validates :user_id, presence: true
  validates :public, presence: true
  
  has_many :users
end
