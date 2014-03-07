class AddCoverPhotoToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :coverphoto, :integer
  end
end
