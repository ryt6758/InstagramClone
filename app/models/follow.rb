class Follow < ApplicationRecord
	belongs_to :user_id, class_name: "User"
	belongs_to :follower_user_id, class_name: "User"

	validates :user_id, presence: true
	validates :follower_user_id, presence: true
end
