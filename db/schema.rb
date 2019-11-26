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

ActiveRecord::Schema.define(version: 2019_11_25_062604) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "command_params", force: :cascade do |t|
    t.string "param_key", null: false
    t.string "param_value", null: false
    t.boolean "optional", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "default_command_id"
    t.index ["default_command_id"], name: "index_command_params_on_default_command_id"
  end

  create_table "default_commands", force: :cascade do |t|
    t.string "class_name", null: false
    t.string "method_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.string "method_type", null: false
    t.string "return_type"
  end

  create_table "guild_commands", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "enabled", default: true
    t.bigint "guild_id"
    t.bigint "default_command_id"
    t.string "command"
    t.index ["command"], name: "index_guild_commands_on_command"
    t.index ["default_command_id", "guild_id"], name: "index_guild_commands_on_default_command_id_and_guild_id", unique: true
    t.index ["default_command_id"], name: "index_guild_commands_on_default_command_id"
    t.index ["guild_id"], name: "index_guild_commands_on_guild_id"
  end

  create_table "guilds", force: :cascade do |t|
    t.bigint "guild_id", null: false
    t.string "name"
    t.bigint "user_id", null: false
    t.string "permissions"
    t.string "prefix", default: "!", null: false
    t.index ["guild_id"], name: "index_guilds_on_guild_id"
    t.index ["user_id"], name: "index_guilds_on_user_id"
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

  add_foreign_key "command_params", "default_commands"
  add_foreign_key "guild_commands", "guilds"
  add_foreign_key "guilds", "users"
end
