class CreatePostAttachments < ActiveRecord::Migration
  def change
    create_table :post_attachments do |t|
      t.integer :post_id
      t.string :src

      t.timestamps
    end
  end
end
