class ChangeInspirationTypeInTable < ActiveRecord::Migration
  def change
  	change_column :trips, :inspiration_type, :string
  end
end
