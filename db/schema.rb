# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_210_501_142_030) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'images', force: :cascade do |t|
    t.string 'author'
    t.string 'camera'
    t.string 'tags'
    t.string 'cropped_picture'
    t.string 'full_picture'
    t.string 'api_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'tokens', force: :cascade do |t|
    t.string 'token'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end
end
