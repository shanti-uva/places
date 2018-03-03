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

ActiveRecord::Schema.define(version: 20180215131323) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"
  enable_extension "postgis_topology"

# Could not dump table "Birth_rate" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "Births_and_deaths" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "Death_rate" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "Economical_activity" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "Ethnic_distribution" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "Han_rate" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "Illiteracy_per_gender" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "Illiteracy_rate" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "Immigration_rate" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "Population_density" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "Population_per_gender" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "Tibetan_rate" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "affiliations", id: :serial, force: :cascade do |t|
    t.integer "collection_id", null: false
    t.integer "feature_id", null: false
    t.integer "perspective_id"
    t.boolean "descendants", default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["collection_id", "feature_id", "perspective_id"], name: "affiliations_on_dependencies", unique: true
  end

  create_table "altitudes", id: :serial, force: :cascade do |t|
    t.integer "feature_id", null: false
    t.integer "maximum"
    t.integer "minimum"
    t.integer "average"
    t.integer "unit_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "estimate", limit: 255
  end

  create_table "authors_descriptions", id: false, force: :cascade do |t|
    t.integer "description_id", null: false
    t.integer "author_id", null: false
  end

  create_table "authors_notes", id: false, force: :cascade do |t|
    t.integer "note_id", null: false
    t.integer "author_id", null: false
  end

# Could not dump table "barkor" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "bellezza" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "blurbs", id: :serial, force: :cascade do |t|
    t.string "code", limit: 255
    t.string "title", limit: 255
    t.text "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cached_category_counts", id: :serial, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "count", null: false
    t.datetime "cache_updated_at", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "count_with_shapes", null: false
    t.index ["category_id"], name: "index_cached_category_counts_on_category_id", unique: true
  end

  create_table "cached_feature_names", id: :serial, force: :cascade do |t|
    t.integer "feature_id", null: false
    t.integer "view_id", null: false
    t.integer "feature_name_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["feature_id", "view_id"], name: "index_cached_feature_names_on_feature_id_and_view_id", unique: true
  end

  create_table "cached_feature_relation_categories", id: :serial, force: :cascade do |t|
    t.integer "feature_id"
    t.integer "related_feature_id"
    t.integer "category_id"
    t.integer "perspective_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "feature_relation_type_id"
    t.boolean "feature_is_parent"
  end

  create_table "captions", id: :serial, force: :cascade do |t|
    t.integer "language_id", null: false
    t.text "content", null: false
    t.integer "author_id", null: false
    t.integer "feature_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_features", id: :integer, default: -> { "nextval('feature_object_types_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "feature_id", null: false
    t.integer "category_id", null: false
    t.integer "perspective_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "position", default: 0, null: false
    t.string "type", limit: 255
    t.string "string_value", limit: 255
    t.integer "numeric_value"
    t.boolean "show_parent", default: false, null: false
    t.boolean "show_root", default: true, null: false
    t.string "label", limit: 255
    t.boolean "prefix_label", default: true, null: false
    t.index ["category_id"], name: "feature_object_types_object_type_id_idx"
    t.index ["feature_id"], name: "feature_object_types_feature_id_idx"
    t.index ["perspective_id"], name: "feature_object_types_perspective_id_idx"
  end

  create_table "citations", id: :serial, force: :cascade do |t|
    t.integer "info_source_id", null: false
    t.string "citable_type", null: false
    t.integer "citable_id", null: false
    t.text "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "info_source_type", limit: 255, null: false
    t.index ["citable_id", "citable_type"], name: "citations_1_idx"
    t.index ["info_source_id"], name: "citations_info_source_id_idx"
  end

  create_table "collections_users", id: false, force: :cascade do |t|
    t.integer "collection_id", null: false
    t.integer "user_id", null: false
    t.index ["user_id", "collection_id"], name: "index_collections_users_on_user_id_and_collection_id", unique: true
  end

  create_table "complex_dates", id: :serial, force: :cascade do |t|
    t.integer "year"
    t.integer "year_certainty_id"
    t.integer "season_id"
    t.integer "season_certainty_id"
    t.integer "month"
    t.integer "month_certainty_id"
    t.integer "day"
    t.integer "day_certainty_id"
    t.integer "day_of_week_id"
    t.integer "day_of_week_certainty_id"
    t.integer "time_of_day_id"
    t.integer "time_of_day_certainty_id"
    t.integer "hour"
    t.integer "hour_certainty_id"
    t.integer "minute"
    t.integer "minute_certainty_id"
    t.integer "animal_id"
    t.integer "animal_certainty_id"
    t.integer "calendrical_id"
    t.integer "calendrical_certainty_id"
    t.integer "element_certainty_id"
    t.integer "element_id"
    t.integer "gender_id"
    t.integer "gender_certainty_id"
    t.integer "intercalary_month_id"
    t.integer "intercalary_day_id"
    t.integer "rabjung_id"
    t.integer "rabjung_certainty_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "year_end"
    t.integer "season_end_id"
    t.integer "month_end"
    t.integer "day_end"
    t.integer "day_of_week_end_id"
    t.integer "time_of_day_end_id"
    t.integer "hour_end"
    t.integer "minute_end"
    t.integer "rabjung_end_id"
    t.integer "intercalary_month_end_id"
    t.integer "intercalary_day_end_id"
  end

  create_table "contestations", id: :serial, force: :cascade do |t|
    t.integer "feature_id", null: false
    t.boolean "contested", default: true, null: false
    t.integer "administrator_id"
    t.integer "claimant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cumulative_category_feature_associations", id: :serial, force: :cascade do |t|
    t.integer "feature_id", null: false
    t.integer "category_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["category_id", "feature_id"], name: "by_category_feature", unique: true
  end

  create_table "descriptions", id: :serial, force: :cascade do |t|
    t.integer "feature_id", null: false
    t.text "content", null: false
    t.boolean "is_primary", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "title", limit: 255
    t.string "source_url", limit: 255
    t.integer "language_id", null: false
  end

# Could not dump table "drepung_thl" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "electricity_use_10_million_watt_hours" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "external_pictures", id: :serial, force: :cascade do |t|
    t.string "url", limit: 255, null: false
    t.text "caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "place_id"
  end

  create_table "feature_geo_codes", id: :serial, force: :cascade do |t|
    t.integer "feature_id", null: false
    t.integer "geo_code_type_id", null: false
    t.integer "timespan_id"
    t.string "geo_code_value", null: false
    t.text "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feature_name_relations", id: :serial, force: :cascade do |t|
    t.integer "child_node_id", null: false
    t.integer "parent_node_id", null: false
    t.string "ancestor_ids", limit: 255
    t.integer "is_phonetic", limit: 2, default: -> { "(0)::smallint" }
    t.integer "is_orthographic", limit: 2, default: -> { "(0)::smallint" }
    t.integer "is_translation", limit: 2, default: -> { "(0)::smallint" }
    t.integer "is_alt_spelling", limit: 2, default: -> { "(0)::smallint" }
    t.integer "phonetic_system_id"
    t.integer "orthographic_system_id"
    t.integer "alt_spelling_system_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["child_node_id"], name: "feature_name_relations_child_node_id_idx"
    t.index ["parent_node_id"], name: "feature_name_relations_parent_node_id_idx"
  end

  create_table "feature_names", id: :serial, force: :cascade do |t|
    t.integer "feature_id", null: false
    t.string "name", limit: 255, null: false
    t.integer "feature_name_type_id"
    t.string "ancestor_ids", limit: 255
    t.integer "position", default: 0
    t.text "etymology"
    t.integer "writing_system_id"
    t.integer "language_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "is_primary_for_romanization", default: false
    t.index ["ancestor_ids"], name: "feature_names_ancestor_ids_idx"
    t.index ["feature_id"], name: "feature_names_feature_id_idx"
    t.index ["name"], name: "feature_names_name_idx"
  end

  create_table "feature_relation_types", id: :serial, force: :cascade do |t|
    t.boolean "is_symmetric"
    t.string "label", limit: 255, null: false
    t.string "asymmetric_label", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "code", limit: 255, null: false
    t.boolean "is_hierarchical", default: false, null: false
    t.string "asymmetric_code", limit: 255
  end

  create_table "feature_relations", id: :serial, force: :cascade do |t|
    t.integer "child_node_id", null: false
    t.integer "parent_node_id", null: false
    t.string "ancestor_ids", limit: 255
    t.text "notes"
    t.string "role", limit: 20
    t.integer "perspective_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "feature_relation_type_id", null: false
    t.index ["ancestor_ids"], name: "feature_relations_ancestor_ids_idx"
    t.index ["child_node_id"], name: "feature_relations_child_node_id_idx"
    t.index ["parent_node_id"], name: "feature_relations_parent_node_id_idx"
    t.index ["perspective_id"], name: "feature_relations_perspective_id_idx"
    t.index ["role"], name: "feature_relations_role_idx"
  end

  create_table "features", id: :serial, force: :cascade do |t|
    t.integer "is_public", limit: 2, default: -> { "(0)::smallint" }
    t.integer "position", default: 0
    t.string "ancestor_ids", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "old_pid", limit: 255
    t.boolean "is_blank", default: false, null: false
    t.integer "fid", null: false
    t.boolean "is_name_position_overriden", default: false, null: false
    t.index ["ancestor_ids"], name: "features_ancestor_ids_idx"
    t.index ["fid"], name: "features_fid", unique: true
    t.index ["is_public"], name: "features_is_public_idx"
  end

# Could not dump table "fixed_lhasa_temples" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "fontdemo" because of following StandardError
#   Unknown type 'geometry' for column 'geometry'

  create_table "gis_id_xref", id: false, force: :cascade do |t|
    t.integer "gis_id"
    t.integer "fid"
  end

# Could not dump table "grain_output_tons" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "illiteracy_per_gender" because of following StandardError
#   Unknown type 'geometry' for column 'geometry'

  create_table "illustrations", id: :serial, force: :cascade do |t|
    t.integer "feature_id", null: false
    t.integer "picture_id", null: false
    t.string "picture_type", limit: 255, null: false
    t.boolean "is_primary", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "importation_tasks", id: :serial, force: :cascade do |t|
    t.string "task_code", limit: 255, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "imported_spreadsheets", id: :serial, force: :cascade do |t|
    t.string "filename", limit: 255, null: false
    t.integer "task_id", null: false
    t.datetime "imported_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "imports", id: :serial, force: :cascade do |t|
    t.integer "spreadsheet_id", null: false
    t.integer "item_id", null: false
    t.string "item_type", limit: 255, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "info_sources", id: :serial, force: :cascade do |t|
    t.string "code", limit: 255, null: false
    t.string "title", limit: 255
    t.string "agent", limit: 255
    t.date "date_published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["code"], name: "info_sources_code_key", unique: true
  end

# Could not dump table "jokhang" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "khrom_empire_garrisons" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "landcover" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "layer", primary_key: ["topology_id", "layer_id"], force: :cascade do |t|
    t.integer "topology_id", null: false
    t.integer "layer_id", null: false
    t.string "schema_name", null: false
    t.string "table_name", null: false
    t.string "feature_column", null: false
    t.integer "feature_type", null: false
    t.integer "level", default: 0, null: false
    t.integer "child_id"
    t.index ["schema_name", "table_name", "feature_column"], name: "layer_schema_name_table_name_feature_column_key", unique: true
  end

# Could not dump table "lhasa_temples" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "lingkor" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "mountain_peaks" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "norbulingka" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "note_titles", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", id: :serial, force: :cascade do |t|
    t.string "notable_type", null: false
    t.integer "notable_id", null: false
    t.integer "note_title_id"
    t.string "custom_note_title", limit: 255
    t.text "content", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "association_type", limit: 255
    t.boolean "is_public", default: true
  end

  create_table "pages", id: :serial, force: :cascade do |t|
    t.integer "citation_id", null: false
    t.integer "volume"
    t.integer "start_page"
    t.integer "start_line"
    t.integer "end_page"
    t.integer "end_line"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

# Could not dump table "parcel" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "people", id: :serial, force: :cascade do |t|
    t.string "fullname", limit: 255, null: false
    t.index ["fullname"], name: "index_people_on_fullname", unique: true
  end

  create_table "permissions", id: :serial, force: :cascade do |t|
    t.string "title", limit: 60, null: false
    t.text "description"
    t.index ["title"], name: "index_permissions_on_title", unique: true
  end

  create_table "permissions_roles", id: false, force: :cascade do |t|
    t.integer "permission_id", null: false
    t.integer "role_id", null: false
    t.index ["permission_id", "role_id"], name: "index_permissions_roles_on_permission_id_and_role_id", unique: true
  end

  create_table "perspectives", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "code", limit: 255
    t.text "description"
    t.text "notes"
    t.boolean "is_public", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["code"], name: "index_perspectives_on_code"
  end

# Could not dump table "potala" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "river" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "road" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "roles", id: :serial, force: :cascade do |t|
    t.string "title", limit: 20, null: false
    t.text "description"
    t.index ["title"], name: "index_roles_on_title", unique: true
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "role_id", null: false
    t.integer "user_id", null: false
    t.index ["role_id", "user_id"], name: "index_roles_users_on_role_id_and_user_id", unique: true
  end

# Could not dump table "roman_popular" because of following StandardError
#   Unknown type 'geometry' for column 'geometry'

# Could not dump table "roman_scholarly" because of following StandardError
#   Unknown type 'geometry' for column 'geometry'

# Could not dump table "sera_hermitage" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "sera_hermitage_boundary" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "sera_monastery_1966" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "sera_monastery_2003" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "sera_monastery_thl" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "shapes" because of following StandardError
#   Unknown type 'geometry' for column 'geometry'

# Could not dump table "simple_chinese" because of following StandardError
#   Unknown type 'geometry' for column 'geometry'

  create_table "simple_props", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "code", limit: 255
    t.text "description"
    t.text "notes"
    t.string "type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["code"], name: "simple_props_code_idx"
    t.index ["type"], name: "simple_props_type_idx"
  end

  create_table "spatial_ref_sys", primary_key: "srid", id: :integer, default: nil, force: :cascade do |t|
    t.string "auth_name", limit: 256
    t.integer "auth_srid"
    t.string "srtext", limit: 2048
    t.string "proj4text", limit: 2048
  end

# Could not dump table "structure_city" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "structures_valley" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "summaries", id: :serial, force: :cascade do |t|
    t.integer "language_id", null: false
    t.text "content", null: false
    t.integer "author_id", null: false
    t.integer "feature_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "symbol_type", id: false, force: :cascade do |t|
    t.integer "object_type"
    t.string "symbol"
  end

# Could not dump table "test2" because of following StandardError
#   Unknown type 'geometry' for column 'geometry'

# Could not dump table "tibetan_roman" because of following StandardError
#   Unknown type 'geometry' for column 'geometry'

  create_table "time_units", id: :serial, force: :cascade do |t|
    t.integer "date_id"
    t.integer "start_date_id"
    t.integer "end_date_id"
    t.integer "calendar_id"
    t.boolean "is_range"
    t.integer "dateable_id"
    t.string "dateable_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "frequency_id"
  end

  create_table "timespans", id: :serial, force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.integer "start_date_fuzz"
    t.integer "end_date_fuzz"
    t.integer "is_current", limit: 2, default: -> { "(1)::smallint" }
    t.integer "dateable_id", null: false
    t.string "dateable_type", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["dateable_id", "dateable_type"], name: "timespans_1_idx"
    t.index ["end_date"], name: "timespans_end_date_idx"
    t.index ["start_date"], name: "timespans_start_date_idx"
  end

# Could not dump table "tlatlong" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "topology", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.integer "srid", null: false
    t.float "precision", null: false
    t.boolean "hasz", default: false, null: false
    t.index ["name"], name: "topology_name_key", unique: true
  end

# Could not dump table "traditional_chinese" because of following StandardError
#   Unknown type 'geometry' for column 'geometry'

  create_table "trtibet", id: false, force: :cascade do |t|
    t.string "pc", limit: 1
    t.string "std", limit: 7
  end

# Could not dump table "tsekor" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "ulatlong" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "us_counties" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "us_districts" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "us_states" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "login", limit: 255, null: false
    t.string "email", limit: 255, null: false
    t.integer "person_id", null: false
    t.string "crypted_password", limit: 40
    t.string "salt", limit: 40
    t.string "remember_token", limit: 255
    t.datetime "remember_token_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "identity_url", limit: 255
    t.string "shibboleth_id", limit: 255
  end

  create_table "web_pages", id: :serial, force: :cascade do |t|
    t.string "path", limit: 255, null: false
    t.string "title", limit: 255, null: false
    t.integer "citation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "xml_documents", id: :serial, force: :cascade do |t|
    t.integer "feature_id", null: false
    t.text "document", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["feature_id"], name: "xml_documents_feature_id_idx"
  end

# Could not dump table "zhol" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  add_foreign_key "layer", "topology", name: "layer_topology_id_fkey"
end
