class Follow < ApplicationRecord
  validates :user_id, presence: true
  validates :followed_user_id, presence: true
end
