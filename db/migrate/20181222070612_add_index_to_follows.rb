class AddIndexToFollows < ActiveRecord::Migration[5.2]
  def change
  	add_index :follows, [:user_id, :follower_user_id], unique: true
  end
end
