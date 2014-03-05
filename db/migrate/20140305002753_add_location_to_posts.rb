class AddLocationToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :location, :string
  	add_column :posts, :longitude, :decimal, precision: 9, scale: 6
  	add_column :posts, :latitude, :decimal, precision: 9, scale: 6
  end
end
