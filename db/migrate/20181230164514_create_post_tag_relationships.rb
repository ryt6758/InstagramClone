class CreatePostTagRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :post_tag_relationships do |t|
      t.integer :post_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
