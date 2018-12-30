class Tag < ApplicationRecord
  has_many :post_tag_relationships
  has_many :posts, through: :post_tag_relationships
end
