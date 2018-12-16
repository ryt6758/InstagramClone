class ChangeColumnToPosts < ActiveRecord::Migration[5.2]
  def up
  	change_column :posts, :content, :text
  end

  def down
  	change_column :posts, :content, :string
  end
  
end
