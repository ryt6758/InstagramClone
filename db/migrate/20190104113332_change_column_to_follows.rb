class ChangeColumnToFollows < ActiveRecord::Migration[5.2]
  def change
    rename_column :follows, :follower_user_id, :followed_user_id
  end
end
