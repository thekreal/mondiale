class RemoveDatesFromChapters < ActiveRecord::Migration
  def change
  	remove_column :chapters, :start_date
  	remove_column :chapters, :end_date
  end
end
