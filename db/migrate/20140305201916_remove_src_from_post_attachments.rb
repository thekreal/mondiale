class RemoveSrcFromPostAttachments < ActiveRecord::Migration
  def change
  	remove_column :post_attachments, :src
  	add_column :post_attachments, :postimage,  :string
  end
end
