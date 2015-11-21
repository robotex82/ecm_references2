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

ActiveRecord::Schema.define(version: 20151121122216) do

  create_table "ecm_pictures_attached_pictures", force: :cascade do |t|
    t.integer  "ecm_pictures_picture_id"
    t.integer  "pictureable_id"
    t.string   "pictureable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ecm_pictures_picture_galleries", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "link_images"
    t.integer  "pictures_count",  default: 0, null: false
    t.integer  "position"
    t.string   "markup_language"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ecm_pictures_pictures", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "picture_gallery_id"
    t.integer  "position"
    t.string   "markup_language"
    t.string   "slug"
    t.string   "image_file_name"
    t.integer  "image_file_size"
    t.string   "image_content_type"
    t.datetime "image_updated_at"
    t.string   "image_fingerprint"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ecm_references_categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "locale"
    t.string   "markup_language"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "parent_id"
    t.integer  "depth"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ecm_references_categories", ["parent_id"], name: "index_ecm_references_categories_on_parent_id"

  create_table "ecm_references_references", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "position"
    t.string   "markup_language"
    t.datetime "published_at"
    t.string   "slug"
    t.integer  "ecm_categories_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
