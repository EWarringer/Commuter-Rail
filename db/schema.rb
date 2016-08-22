# encoding: UTF-8

ActiveRecord::Schema.define(version: 20160807181414) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "origins", force: :cascade do |t|
    t.string "origin", null: false
  end

  create_table "trains", force: :cascade do |t|
    t.string  "trip",           null: false
    t.string  "track",          null: false
    t.string  "destination",    null: false
    t.string  "status",         null: false
    t.string  "scheduled_time", null: false
    t.string  "current_time"
    t.integer "origin_id"
  end

end
