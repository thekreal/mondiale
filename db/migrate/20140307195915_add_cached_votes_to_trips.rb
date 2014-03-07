class AddCachedVotesToTrips < ActiveRecord::Migration
  def change
  	add_column :trips, :cached_votes_total, :integer, :default => 0
  	add_index  :trips, :cached_votes_total
  end
end
