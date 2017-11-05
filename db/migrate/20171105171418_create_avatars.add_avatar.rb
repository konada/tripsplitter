# This migration comes from add_avatar (originally 20171105120943)
class CreateAvatars < ActiveRecord::Migration
  def change
    create_table :avatars do |t|
      t.integer :source_id, null: false
      t.string :source_type
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
    end
    add_index :avatars, :source_id
  end
end
