class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :post_tag_relationships
  has_many :tags, through: :post_tag_relationships
  has_one_attached :image
end
