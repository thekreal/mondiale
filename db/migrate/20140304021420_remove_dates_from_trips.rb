class RemoveDatesFromTrips < ActiveRecord::Migration
  def change
  	remove_column :trips, :start_date
  	remove_column :trips, :end_date
  end
end
