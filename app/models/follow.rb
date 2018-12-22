class Follow < ApplicationRecord
	belongs_to :user

	validates :user_id, presence: true
	validates :follower_user_id, presence: true
end
