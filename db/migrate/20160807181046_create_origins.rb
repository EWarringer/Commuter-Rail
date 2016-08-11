class CreateOrigins < ActiveRecord::Migration
  def change
    create_table :origins do |t|
      t.string :origin, null:false
    end
  end
end
