class AddsDatesToChapters < ActiveRecord::Migration
  def change
  	add_column :chapters, :start_date, :date
  	add_column :chapters, :end_date, :date
  	add_column :chapters, :created_at, :datetime
    add_column :chapters, :updated_at, :datetime
  end
end
