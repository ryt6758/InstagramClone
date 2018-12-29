class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :follows, class_name: "Follow",
            foreign_key: "user_id",
            dependent: :destroy
  has_one_attached :avatar

  validates :email, presence: true
  validates :password, presence: true
  validates :name, presence: true
end
