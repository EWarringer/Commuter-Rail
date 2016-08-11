class CreateTrains < ActiveRecord::Migration
  def change
    create_table :trains do |t|
      t.string :trip, null: false
      t.string :track, null: false
      t.string :destination, null: false
      t.string :status, null: false
      t.string :scheduled_time, null: false
      t.string :origin, null: false
    end
  end
end
