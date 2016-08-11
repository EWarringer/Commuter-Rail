class AddCurrentTimeToTrains < ActiveRecord::Migration
  def change
    add_column :trains, :current_time, :string
  end
end
