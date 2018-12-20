class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments
  has_one_attached :avatar

  validates :email, presence: true
  validates :password, presence: true
  validates :name, presence: true
end
