class AddInspirationToChapter < ActiveRecord::Migration
  def change
  	add_column :chapters, :inspiration_type, :string
  	add_column :chapters, :inspiration_id, :integer
  end
end
