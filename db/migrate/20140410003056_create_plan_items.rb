class CreatePlanItems < ActiveRecord::Migration
  def change
    create_table :plan_items do |t|
    	t.integer :trip_plan_id
    	t.string :title
    	t.datetime :date
    	t.timestamps
    	t.string :location
    	t.decimal  :longitude,      precision: 9, scale: 6
    	t.decimal  :latitude,       precision: 9, scale: 6
    end
  end
end
