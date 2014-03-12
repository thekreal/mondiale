class DropInspirationTypesColumns < ActiveRecord::Migration
  def change
  	remove_column :posts, :inspiration_type
  	remove_column :chapters, :inspiration_type
  	remove_column :trips, :inspiration_type
  end
end
