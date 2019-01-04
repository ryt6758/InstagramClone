class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :user_follows, class_name: "Follow", dependent: :destroy
  has_many :followings, through: :user_follows
  has_many :user_followers, class_name: "Follow", foreign_key: "followed_user_id"
  has_many :followers, through: :user_followers
  has_one_attached :avatar

  validates :email, presence: true
  validates :password, presence: true
  validates :name, presence: true
end
