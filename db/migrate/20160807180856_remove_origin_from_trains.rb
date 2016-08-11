class RemoveOriginFromTrains < ActiveRecord::Migration
  def change
    remove_column :trains, :origin, :string
  end
end
