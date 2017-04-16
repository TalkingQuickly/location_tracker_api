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

ActiveRecord::Schema.define(version: 20170416122924) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "geonames_alternate_names", force: :cascade do |t|
    t.integer  "alternate_name_id"
    t.integer  "geonameid"
    t.string   "isolanguage"
    t.string   "alternate_name"
    t.boolean  "is_preferred_name"
    t.boolean  "is_short_name"
    t.boolean  "is_colloquial"
    t.boolean  "is_historic"
    t.string   "alternate_name_first_letters"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["alternate_name_first_letters"], name: "index_geonames_alternate_names_on_alternate_name_first_letters", using: :btree
    t.index ["alternate_name_id"], name: "index_geonames_alternate_names_on_alternate_name_id", using: :btree
    t.index ["geonameid"], name: "index_geonames_alternate_names_on_geonameid", using: :btree
    t.index ["isolanguage"], name: "index_geonames_alternate_names_on_isolanguage", using: :btree
  end

  create_table "geonames_countries", force: :cascade do |t|
    t.string   "iso"
    t.string   "iso3"
    t.string   "iso_numeric"
    t.string   "fips"
    t.string   "country"
    t.string   "capital"
    t.integer  "area"
    t.integer  "population"
    t.string   "continent"
    t.string   "tld"
    t.string   "currency_code"
    t.string   "currency_name"
    t.string   "phone"
    t.string   "postal_code_format"
    t.string   "postal_code_regex"
    t.string   "languages"
    t.integer  "geonameid"
    t.string   "neighbours"
    t.string   "equivalent_fips_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["geonameid"], name: "index_geonames_countries_on_geonameid", using: :btree
  end

  create_table "geonames_features", force: :cascade do |t|
    t.integer  "geonameid"
    t.string   "name"
    t.string   "asciiname"
    t.text     "alternatenames"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "feature_class"
    t.string   "feature_code"
    t.string   "country_code"
    t.string   "cc2"
    t.string   "admin1_code"
    t.string   "admin2_code"
    t.string   "admin3_code"
    t.string   "admin4_code"
    t.integer  "population"
    t.integer  "elevation"
    t.integer  "dem"
    t.string   "timezone"
    t.datetime "modification"
    t.string   "type"
    t.string   "asciiname_first_letters"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["admin1_code"], name: "index_geonames_features_on_admin1_code", using: :btree
    t.index ["asciiname"], name: "index_geonames_features_on_asciiname", using: :btree
    t.index ["asciiname_first_letters"], name: "index_geonames_features_on_asciiname_first_letters", using: :btree
    t.index ["country_code"], name: "index_geonames_features_on_country_code", using: :btree
    t.index ["geonameid"], name: "index_geonames_features_on_geonameid", using: :btree
    t.index ["name"], name: "index_geonames_features_on_name", using: :btree
    t.index ["population"], name: "index_geonames_features_on_population", using: :btree
    t.index ["type"], name: "index_geonames_features_on_type", using: :btree
  end

  create_table "geonames_iso_languagecodes", force: :cascade do |t|
    t.string   "iso_639_3"
    t.string   "iso_639_2"
    t.string   "iso_639_1"
    t.string   "language_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: :cascade do |t|
    t.json     "raw"
    t.float    "lat"
    t.datetime "timestamp"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.float    "lng"
    t.integer  "user_id"
    t.integer  "geonames_city_id"
    t.integer  "geonames_country_id"
  end

  create_table "users", force: :cascade do |t|
    t.text     "email"
    t.text     "token"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.text     "encrypted_password", default: "", null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  create_table "visited_cities", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "geonames_city_id"
    t.integer  "geonames_country_id"
    t.datetime "arrived"
    t.datetime "departed"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

end
