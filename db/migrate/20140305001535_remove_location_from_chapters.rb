class RemoveLocationFromChapters < ActiveRecord::Migration
  def change
  	remove_column :chapters, :location
  	remove_column :chapters, :longitude
  	remove_column :chapters, :latitude
  end
end
