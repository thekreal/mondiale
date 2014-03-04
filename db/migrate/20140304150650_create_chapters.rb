class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|

    	t.string :title
    	t.string :location
    	t.decimal  "longitude",   precision: 9, scale: 6
    	t.decimal  "latitude",    precision: 9, scale: 6
    	t.integer :upvote_score
    	t.integer :trip_id
    end
  end
end
