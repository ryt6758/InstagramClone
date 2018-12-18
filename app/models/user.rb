class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_one_attached :avatar
end
