class AddOriginIdToTrains < ActiveRecord::Migration
  def change
    add_column :trains, :origin_id, :integer
  end
end
