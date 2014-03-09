class AddInspirationToTrip < ActiveRecord::Migration
  def change
  	add_column :trips, :inspiration_type, :integer
  	add_column :trips, :inspiration_id, :integer
  end
end
