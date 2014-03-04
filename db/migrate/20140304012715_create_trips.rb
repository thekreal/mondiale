class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|

    	t.string :title
      t.text :description
      t.text :location_text
      t.decimal  "longitude",   precision: 9, scale: 6
    	t.decimal  "latitude",    precision: 9, scale: 6
      t.integer :user_id
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps
    end
  end
end
