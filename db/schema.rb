# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_10_16_195801) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audios", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_audios_on_post_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.bigint "local_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["local_id"], name: "index_countries_on_local_id"
  end

  create_table "country_names", force: :cascade do |t|
    t.string "name"
    t.bigint "language_id", null: false
    t.bigint "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_country_names_on_country_id"
    t.index ["language_id"], name: "index_country_names_on_language_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_favorites_on_post_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_images_on_post_id"
  end

  create_table "itineraries", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_itineraries_on_post_id"
    t.index ["user_id"], name: "index_itineraries_on_user_id"
  end

  create_table "labels", force: :cascade do |t|
    t.string "my_favorites"
    t.string "already_visited"
    t.string "my_itinerary"
    t.string "remove_all"
    t.string "add"
    t.string "save"
    t.string "view_in_map"
    t.string "share"
    t.string "reorder"
    t.string "edit"
    t.string "delete"
    t.string "choose_itinerary_name"
    t.bigint "language_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_labels_on_language_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "local_names", force: :cascade do |t|
    t.string "name"
    t.bigint "language_id", null: false
    t.bigint "local_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_local_names_on_language_id"
    t.index ["local_id"], name: "index_local_names_on_local_id"
  end

  create_table "locals", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", force: :cascade do |t|
    t.string "introduction"
    t.string "buddha"
    t.string "guru"
    t.bigint "language_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_menus_on_language_id"
  end

  create_table "post_contents", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.text "content"
    t.bigint "post_id", null: false
    t.bigint "language_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_post_contents_on_language_id"
    t.index ["post_id"], name: "index_post_contents_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.float "lat"
    t.float "lng"
    t.bigint "country_id", null: false
    t.bigint "local_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_posts_on_country_id"
    t.index ["local_id"], name: "index_posts_on_local_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "has_admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "audios", "posts"
  add_foreign_key "countries", "locals"
  add_foreign_key "country_names", "countries"
  add_foreign_key "country_names", "languages"
  add_foreign_key "favorites", "posts"
  add_foreign_key "favorites", "users"
  add_foreign_key "images", "posts"
  add_foreign_key "itineraries", "posts"
  add_foreign_key "itineraries", "users"
  add_foreign_key "labels", "languages"
  add_foreign_key "local_names", "languages"
  add_foreign_key "local_names", "locals"
  add_foreign_key "menus", "languages"
  add_foreign_key "post_contents", "languages"
  add_foreign_key "post_contents", "posts"
  add_foreign_key "posts", "countries"
  add_foreign_key "posts", "locals"
end
