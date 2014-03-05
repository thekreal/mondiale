class RemoveLocationsFromTrips < ActiveRecord::Migration
  def change
  	remove_column :trips, :location_text
  	remove_column :trips, :longitude
  	remove_column :trips, :latitude
  end
end
