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

ActiveRecord::Schema.define(version: 20170311111758) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "group_permissions", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "permission_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "group_permissions", ["group_id"], name: "index_group_permissions_on_group_id", using: :btree
  add_index "group_permissions", ["permission_id"], name: "index_group_permissions_on_permission_id", using: :btree

  create_table "group_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "group_users", ["group_id"], name: "index_group_users_on_group_id", using: :btree
  add_index "group_users", ["user_id"], name: "index_group_users_on_user_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "invitation_groups", force: :cascade do |t|
    t.integer  "invitation_id"
    t.integer  "group_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "invitation_groups", ["group_id"], name: "index_invitation_groups_on_group_id", using: :btree
  add_index "invitation_groups", ["invitation_id"], name: "index_invitation_groups_on_invitation_id", using: :btree

  create_table "invitations", force: :cascade do |t|
    t.string   "email"
    t.string   "sent_at"
    t.string   "accepted_at"
    t.string   "token"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "inviter_id"
  end

  add_index "invitations", ["inviter_id"], name: "index_invitations_on_inviter_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "description"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "recipient_id"
    t.integer  "actor_id"
    t.datetime "read_at"
    t.string   "action"
    t.string   "notifiable_type"
    t.integer  "notifiable_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "project_role_locations", force: :cascade do |t|
    t.integer  "project_role_id"
    t.integer  "location_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "project_role_permissions", force: :cascade do |t|
    t.integer  "project_role_id"
    t.integer  "permission_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "project_role_permissions", ["permission_id"], name: "index_project_role_permissions_on_permission_id", using: :btree
  add_index "project_role_permissions", ["project_role_id"], name: "index_project_role_permissions_on_project_role_id", using: :btree

  create_table "project_role_skills", force: :cascade do |t|
    t.integer  "project_role_id"
    t.integer  "skill_id"
    t.integer  "rating"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "project_role_skills", ["project_role_id"], name: "index_project_role_skills_on_project_role_id", using: :btree
  add_index "project_role_skills", ["skill_id"], name: "index_project_role_skills_on_skill_id", using: :btree

  create_table "project_role_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_role_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "project_role_users", ["project_role_id"], name: "index_project_role_users_on_project_role_id", using: :btree
  add_index "project_role_users", ["user_id"], name: "index_project_role_users_on_user_id", using: :btree

  create_table "project_roles", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "project_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "project_roles", ["project_id"], name: "index_project_roles_on_project_id", using: :btree

  create_table "project_types", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "project_type_id"
  end

  add_index "projects", ["project_type_id"], name: "index_projects_on_project_type_id", using: :btree

  create_table "skill_types", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "skill_type_id"
  end

  add_index "skills", ["skill_type_id"], name: "index_skills_on_skill_type_id", using: :btree

  create_table "user_skills", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "skill_id"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_skills", ["skill_id"], name: "index_user_skills_on_skill_id", using: :btree
  add_index "user_skills", ["user_id"], name: "index_user_skills_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "location_id"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["location_id"], name: "index_users_on_location_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "group_permissions", "groups"
  add_foreign_key "group_permissions", "permissions"
  add_foreign_key "group_users", "groups"
  add_foreign_key "group_users", "users"
  add_foreign_key "invitation_groups", "groups"
  add_foreign_key "invitation_groups", "invitations"
  add_foreign_key "invitations", "users", column: "inviter_id"
  add_foreign_key "notifications", "users", column: "actor_id"
  add_foreign_key "notifications", "users", column: "recipient_id"
  add_foreign_key "project_role_locations", "locations"
  add_foreign_key "project_role_locations", "project_roles"
  add_foreign_key "project_role_permissions", "permissions"
  add_foreign_key "project_role_permissions", "project_roles"
  add_foreign_key "project_role_skills", "project_roles"
  add_foreign_key "project_role_skills", "skills"
  add_foreign_key "project_role_users", "project_roles"
  add_foreign_key "project_role_users", "users"
  add_foreign_key "project_roles", "projects"
  add_foreign_key "projects", "project_types"
  add_foreign_key "skills", "skill_types"
  add_foreign_key "user_skills", "skills"
  add_foreign_key "user_skills", "users"
  add_foreign_key "users", "locations"
end
