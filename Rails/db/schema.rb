# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140329033904) do

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "sleeps", force: true do |t|
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sleeps", ["user_id", "created_at"], name: "index_sleeps_on_user_id_and_created_at"

  create_table "supervisor_users", force: true do |t|
    t.integer  "supervisor_id"
    t.integer  "supervised_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "supervisor_users", ["supervised_id"], name: "index_supervisor_users_on_supervised_id"
  add_index "supervisor_users", ["supervisor_id", "supervised_id"], name: "index_supervisor_users_on_supervisor_id_and_supervised_id", unique: true
  add_index "supervisor_users", ["supervisor_id"], name: "index_supervisor_users_on_supervisor_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "supervisor",      default: false
    t.boolean  "admin",           default: false
    t.string   "access_token"
  end

  add_index "users", ["access_token"], name: "index_users_on_access_token"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
