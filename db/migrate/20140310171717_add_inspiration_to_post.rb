class AddInspirationToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :inspiration_type, :string
  	add_column :posts, :inspiration_id, :integer
  end
end
