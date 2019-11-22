# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_22_031945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "guilds", force: :cascade do |t|
    t.string "guild_id", null: false
    t.string "name"
    t.bigint "user_id", null: false
    t.string "permissions"
    t.index ["guild_id"], name: "index_guilds_on_guild_id"
    t.index ["user_id"], name: "index_guilds_on_user_id"
  end

  create_table "user_commands", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "class", null: false
    t.string "method", null: false
    t.string "prefix", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["method"], name: "index_user_commands_on_method"
    t.index ["user_id"], name: "index_user_commands_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.boolean "verified"
    t.string "locale"
    t.bigint "premium_type"
    t.boolean "mfa_enabled"
    t.bigint "_id", null: false
    t.bigint "flags"
    t.string "avatar"
    t.string "discriminator", limit: 4, null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username", "discriminator"], name: "index_users_on_username_and_discriminator", unique: true
  end

  add_foreign_key "guilds", "users"
  add_foreign_key "user_commands", "users"
end
