class CreateInspirations < ActiveRecord::Migration
  def change
    create_table :inspirations do |t|
    	t.integer :user_id
    	t.integer :inspirable_id
    	t.string 	:inspirable_type
    end
  end
end
