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

ActiveRecord::Schema[8.0].define(version: 2023_11_14_203621) do
  create_schema "topology"

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"
  enable_extension "postgis"
  enable_extension "topology.postgis_topology"

  create_table "Birth_rate", primary_key: "gid", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 27
    t.float "pop_total"
    t.float "births_199"
    t.float "rate"
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.check_constraint "geometrytype(the_geom) = 'POLYGON'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 4326", name: "enforce_srid_the_geom"
  end

  create_table "Births_and_deaths", primary_key: "gid", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 27
    t.float "births_1990"
    t.float "deaths_1990"
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.check_constraint "geometrytype(the_geom) = 'POLYGON'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 4326", name: "enforce_srid_the_geom"
  end

  create_table "Death_rate", primary_key: "gid", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 27
    t.float "pop_total"
    t.float "death_1990"
    t.float "rate"
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.check_constraint "geometrytype(the_geom) = 'POLYGON'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 4326", name: "enforce_srid_the_geom"
  end

  create_table "Economical_activity", primary_key: "gid", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 27
    t.float "agriculture"
    t.float "industry"
    t.float "mining"
    t.float "constructio"
    t.float "government_"
    t.integer "other"
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.check_constraint "geometrytype(the_geom) = 'POLYGON'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 4326", name: "enforce_srid_the_geom"
  end

  create_table "Ethnic_distribution", primary_key: "gid", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 27
    t.float "population_"
    t.float "Han"
    t.float "Tibetans"
    t.float "Mongols"
    t.float "Hui"
    t.integer "other"
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.check_constraint "geometrytype(the_geom) = 'POLYGON'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 4326", name: "enforce_srid_the_geom"
  end

  create_table "Han_rate", primary_key: "gid", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 27
    t.float "pop_total"
    t.float "pop_han"
    t.float "rate"
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.check_constraint "geometrytype(the_geom) = 'POLYGON'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 4326", name: "enforce_srid_the_geom"
  end

  create_table "Illiteracy_per_gender", primary_key: "gid", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 27
    t.float "pop_total"
    t.float "illit_male"
    t.float "illit_fem"
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.check_constraint "geometrytype(the_geom) = 'POLYGON'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 4326", name: "enforce_srid_the_geom"
  end

  create_table "Illiteracy_rate", primary_key: "gid", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 27
    t.float "pop_total"
    t.float "pop_illet"
    t.float "rate"
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.check_constraint "geometrytype(the_geom) = 'POLYGON'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 4326", name: "enforce_srid_the_geom"
  end

  create_table "Immigration_rate", primary_key: "gid", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 27
    t.integer "pop_total"
    t.float "immig"
    t.float "rate"
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.check_constraint "geometrytype(the_geom) = 'POLYGON'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 4326", name: "enforce_srid_the_geom"
  end

  create_table "Population_density", primary_key: "gid", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 27
    t.float "pop_total"
    t.float "sq_km"
    t.float "density"
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.check_constraint "geometrytype(the_geom) = 'POLYGON'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 4326", name: "enforce_srid_the_geom"
  end

  create_table "Population_per_gender", primary_key: "gid", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 27
    t.float "males_1990"
    t.float "females_199"
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.check_constraint "geometrytype(the_geom) = 'POLYGON'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 4326", name: "enforce_srid_the_geom"
  end

  create_table "Tibetan_rate", primary_key: "gid", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 27
    t.float "pop_total"
    t.float "pop_tib"
    t.float "rate"
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.check_constraint "geometrytype(the_geom) = 'POLYGON'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 4326", name: "enforce_srid_the_geom"
  end

  create_table "affiliations", id: :serial, force: :cascade do |t|
    t.integer "collection_id", null: false
    t.integer "feature_id", null: false
    t.integer "perspective_id"
    t.boolean "descendants", default: true, null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["collection_id", "feature_id", "perspective_id"], name: "affiliations_on_dependencies", unique: true
  end

  create_table "altitudes", id: :serial, force: :cascade do |t|
    t.integer "feature_id", null: false
    t.integer "maximum"
    t.integer "minimum"
    t.integer "average"
    t.integer "unit_id", null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
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

  create_table "barkor", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.integer "id"
    t.string "name", limit: 50
    t.string "name_src", limit: 50
    t.string "shape_src", limit: 50
    t.decimal "pd_id", precision: 10
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.index ["the_geom"], name: "barkor_the_geom_gist", using: :gist
    t.check_constraint "geometrytype(the_geom) = 'MULTILINESTRING'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 32646", name: "enforce_srid_the_geom"
  end

  create_table "bellezza", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.integer "objectid"
    t.decimal "sort_no"
    t.string "type", limit: 254
    t.string "site_no", limit: 254
    t.string "name_wylie", limit: 254
    t.string "name_eng", limit: 254
    t.string "county", limit: 254
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.index ["the_geom"], name: "bellezza_geom", using: :gist
    t.check_constraint "geometrytype(the_geom) = 'POINT'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 4326", name: "enforce_srid_the_geom"
  end

  create_table "blurbs", id: :serial, force: :cascade do |t|
    t.string "code", limit: 255
    t.string "title", limit: 255
    t.text "content"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "cached_category_counts", id: :serial, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "count", null: false
    t.datetime "cache_updated_at", precision: nil, null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "count_with_shapes", null: false
    t.index ["category_id"], name: "index_cached_category_counts_on_category_id", unique: true
  end

  create_table "cached_feature_names", id: :serial, force: :cascade do |t|
    t.integer "feature_id", null: false
    t.integer "view_id", null: false
    t.integer "feature_name_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["feature_id", "view_id"], name: "index_cached_feature_names_on_feature_id_and_view_id", unique: true
  end

  create_table "cached_feature_relation_categories", id: :serial, force: :cascade do |t|
    t.integer "feature_id"
    t.integer "related_feature_id"
    t.integer "category_id"
    t.integer "perspective_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "feature_relation_type_id"
    t.boolean "feature_is_parent"
  end

  create_table "captions", id: :serial, force: :cascade do |t|
    t.integer "language_id", null: false
    t.text "content", null: false
    t.integer "author_id", null: false
    t.integer "feature_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "category_features", id: :integer, default: -> { "nextval('feature_object_types_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "feature_id", null: false
    t.integer "category_id", null: false
    t.integer "perspective_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
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
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
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
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
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
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "cumulative_category_feature_associations", id: :serial, force: :cascade do |t|
    t.integer "feature_id", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["category_id", "feature_id"], name: "by_category_feature", unique: true
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at", precision: nil
    t.datetime "locked_at", precision: nil
    t.datetime "failed_at", precision: nil
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "reference_id"
    t.string "reference_type"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "descriptions", id: :serial, force: :cascade do |t|
    t.integer "feature_id", null: false
    t.text "content", null: false
    t.boolean "is_primary", default: false, null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "title", limit: 255
    t.string "source_url", limit: 255
    t.integer "language_id", null: false
  end

  create_table "drepung_thl", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.string "shape_src", limit: 254
    t.string "name_src", limit: 254
    t.string "name", limit: 254
    t.decimal "type"
    t.integer "stroies"
    t.decimal "pd_id", precision: 10
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.index ["the_geom"], name: "drepung_thl_the_geom_gist", using: :gist
    t.check_constraint "geometrytype(the_geom) = 'MULTIPOLYGON'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 32646", name: "enforce_srid_the_geom"
  end

  create_table "electricity_use_10_million_watt_hours", primary_key: "gid", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 27
    t.float "elect_use"
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.check_constraint "geometrytype(the_geom) = 'POLYGON'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 4326", name: "enforce_srid_the_geom"
  end

  create_table "essays", force: :cascade do |t|
    t.bigint "feature_id", null: false
    t.integer "text_id", null: false
    t.integer "language_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["feature_id"], name: "index_essays_on_feature_id"
  end

  create_table "external_pictures", id: :serial, force: :cascade do |t|
    t.string "url", limit: 255, null: false
    t.text "caption"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "place_id"
  end

  create_table "feature_geo_codes", id: :serial, force: :cascade do |t|
    t.integer "feature_id", null: false
    t.integer "geo_code_type_id", null: false
    t.integer "timespan_id"
    t.string "geo_code_value", null: false
    t.text "notes"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
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
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
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
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.boolean "is_primary_for_romanization", default: false
    t.index ["ancestor_ids"], name: "feature_names_ancestor_ids_idx"
    t.index ["feature_id"], name: "feature_names_feature_id_idx"
    t.index ["name"], name: "feature_names_name_idx"
  end

  create_table "feature_relation_types", id: :serial, force: :cascade do |t|
    t.boolean "is_symmetric"
    t.string "label", limit: 255, null: false
    t.string "asymmetric_label", limit: 255
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
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
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
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
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "old_pid", limit: 255
    t.boolean "is_blank", default: false, null: false
    t.integer "fid", null: false
    t.boolean "is_name_position_overriden", default: false, null: false
    t.index ["ancestor_ids"], name: "features_ancestor_ids_idx"
    t.index ["fid"], name: "features_fid", unique: true
    t.index ["is_public"], name: "features_is_public_idx"
  end

  create_table "fixed_lhasa_temples", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.decimal "id", precision: 10
    t.decimal "gis_id", precision: 10
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.index ["the_geom"], name: "fixed_lhasa_temples_the_geom_gist", using: :gist
    t.check_constraint "geometrytype(the_geom) = 'MULTIPOLYGON'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 4326", name: "enforce_srid_the_geom"
  end

  create_table "fontdemo", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.string "font", limit: 50
    t.string "text", limit: 100
    t.float "x"
    t.float "y"
    t.geometry "geometry", limit: {:srid=>0, :type=>"geometry"}
    t.check_constraint "geometrytype(geometry) = 'POINT'::text OR geometry IS NULL", name: "enforce_geotype_geometry"
    t.check_constraint "st_ndims(geometry) = 2", name: "enforce_dims_geometry"
    t.check_constraint "st_srid(geometry) = 4326", name: "enforce_srid_geometry"
  end

  create_table "gis_id_xref", id: false, force: :cascade do |t|
    t.integer "gis_id"
    t.integer "fid"
  end

  create_table "grain_output_tons", primary_key: "gid", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 27
    t.float "output_tons"
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.check_constraint "geometrytype(the_geom) = 'POLYGON'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 4326", name: "enforce_srid_the_geom"
  end

  create_table "illiteracy_per_gender", id: false, force: :cascade do |t|
    t.text "name"
    t.float "pop_total"
    t.float "illit_male"
    t.float "illit_fem"
    t.geometry "geometry", limit: {:srid=>0, :type=>"geometry"}
    t.check_constraint "st_ndims(geometry) = 2", name: "enforce_dims_geometry"
    t.check_constraint "st_srid(geometry) = 4326", name: "enforce_srid_geometry"
  end

  create_table "illustrations", id: :serial, force: :cascade do |t|
    t.integer "feature_id", null: false
    t.integer "picture_id", null: false
    t.string "picture_type", limit: 255, null: false
    t.boolean "is_primary", default: true, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "importation_tasks", id: :serial, force: :cascade do |t|
    t.string "task_code", limit: 255, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "imported_spreadsheets", id: :serial, force: :cascade do |t|
    t.string "filename", limit: 255, null: false
    t.integer "task_id", null: false
    t.datetime "imported_at", precision: nil, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "imports", id: :serial, force: :cascade do |t|
    t.integer "spreadsheet_id", null: false
    t.integer "item_id", null: false
    t.string "item_type", limit: 255, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "jokhang", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.integer "stories"
    t.string "shape_src", limit: 254
    t.string "name_src", limit: 254
    t.string "name", limit: 254
    t.decimal "type"
    t.decimal "pd_id", precision: 10
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.index ["the_geom"], name: "jokhang_the_geom_gist", using: :gist
    t.check_constraint "geometrytype(the_geom) = 'MULTIPOLYGON'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 32646", name: "enforce_srid_the_geom"
  end

  create_table "khrom_empire_garrisons", primary_key: "gid", id: :integer, default: nil, force: :cascade do |t|
    t.float "AREA"
    t.float "PERIMETER"
    t.integer "VKHROM_"
    t.integer "VKHROM_ID"
    t.float "GIS_ID"
    t.string "khrom__gar", limit: 254
    t.string "Region_s_", limit: 254
    t.string "Location_n", limit: 254
    t.string "source", limit: 254
    t.float "X_Deg"
    t.float "X_Min"
    t.float "Y_Deg"
    t.float "Y_Min"
    t.string "F10", limit: 254
    t.float "X_dd"
    t.float "Y_dd"
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.check_constraint "geometrytype(the_geom) = 'POINT'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 4326", name: "enforce_srid_the_geom"
  end

  create_table "landcover", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.string "type", limit: 40
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.index ["the_geom"], name: "landcover_geom", using: :gist
  end

  create_table "lhasa_temples", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.integer "id"
    t.integer "gis_id"
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.check_constraint "geometrytype(the_geom) = 'MULTIPOLYGON'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 4326", name: "enforce_srid_the_geom"
  end

  create_table "lingkor", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.integer "id"
    t.string "name", limit: 50
    t.string "name_src", limit: 50
    t.string "shape_src", limit: 50
    t.decimal "pd_id", precision: 10
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.index ["the_geom"], name: "lingkor_the_geom_gist", using: :gist
    t.check_constraint "geometrytype(the_geom) = 'MULTILINESTRING'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 32646", name: "enforce_srid_the_geom"
  end

  create_table "mountain_peaks", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.integer "id"
    t.decimal "pd_id"
    t.string "name", limit: 50
    t.decimal "elevation"
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.index ["the_geom"], name: "mountain_peaks_the_geom_gist", using: :gist
    t.check_constraint "geometrytype(the_geom) = 'POINT'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 32646", name: "enforce_srid_the_geom"
  end

  create_table "norbulingka", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.string "district", limit: 254
    t.integer "id"
    t.string "shape_src", limit: 254
    t.string "name_src", limit: 254
    t.string "name", limit: 254
    t.decimal "type"
    t.integer "stroies"
    t.decimal "pd_id", precision: 10
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.index ["the_geom"], name: "norbulingka_the_geom_gist", using: :gist
    t.check_constraint "geometrytype(the_geom) = 'MULTIPOLYGON'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 32646", name: "enforce_srid_the_geom"
  end

  create_table "note_titles", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "notes", id: :serial, force: :cascade do |t|
    t.string "notable_type", null: false
    t.integer "notable_id", null: false
    t.integer "note_title_id"
    t.string "custom_note_title", limit: 255
    t.text "content", null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "association_type", limit: 255
    t.boolean "is_public", default: true
  end

  create_table "pages", id: :serial, force: :cascade do |t|
    t.integer "citation_id", null: false
    t.string "volume"
    t.integer "start_page"
    t.string "start_line"
    t.integer "end_page"
    t.integer "end_line"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "chapter"
    t.string "tibetan_start_page"
    t.integer "start_verse"
    t.integer "end_verse"
  end

  create_table "parcel", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.string "district", limit: 10
    t.integer "id", limit: 2
    t.string "type", limit: 50
    t.string "aufid_cs_2", limit: 254
    t.decimal "pd_id"
    t.string "shapefile_", limit: 50
    t.string "name_src", limit: 50
    t.string "fname", limit: 50
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.index ["the_geom"], name: "parcel_the_geom_gist", using: :gist
    t.check_constraint "geometrytype(the_geom) = 'MULTIPOLYGON'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 32646", name: "enforce_srid_the_geom"
  end

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
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["code"], name: "index_perspectives_on_code"
  end

  create_table "potala", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.string "district", limit: 10
    t.string "shape_src", limit: 50
    t.string "name_src", limit: 50
    t.string "type", limit: 50
    t.integer "stories"
    t.string "name", limit: 50
    t.string "url", limit: 50
    t.decimal "pd_id", precision: 10
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.index ["the_geom"], name: "potala_the_geom_gist", using: :gist
    t.check_constraint "geometrytype(the_geom) = 'MULTIPOLYGON'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 32646", name: "enforce_srid_the_geom"
  end

  create_table "river", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.decimal "pd_id", precision: 10
    t.string "shape_src", limit: 50
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.index ["the_geom"], name: "river_the_geom_gist", using: :gist
    t.check_constraint "geometrytype(the_geom) = 'MULTIPOLYGON'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 32646", name: "enforce_srid_the_geom"
  end

  create_table "road", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.integer "id"
    t.string "name", limit: 50
    t.string "name_src", limit: 50
    t.string "shape_src", limit: 50
    t.decimal "pd_id", precision: 10
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.index ["the_geom"], name: "road_the_geom_gist", using: :gist
    t.check_constraint "geometrytype(the_geom) = 'MULTILINESTRING'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 32646", name: "enforce_srid_the_geom"
  end

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

  create_table "roman_popular", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.integer "fid"
    t.integer "object_type"
    t.string "language", limit: 255
    t.string "name", limit: 255
    t.text "geotype"
    t.geometry "geometry", limit: {:srid=>0, :type=>"geometry"}
    t.index ["fid"], name: "roman_popular_fid"
    t.index ["geometry"], name: "roman_popular_gist", using: :gist
    t.index ["language"], name: "roman_popular_language"
    t.index ["object_type"], name: "roman_popular_object_type"
  end

  create_table "roman_scholarly", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.integer "fid"
    t.integer "object_type"
    t.string "language", limit: 255
    t.string "name", limit: 255
    t.text "geotype"
    t.geometry "geometry", limit: {:srid=>0, :type=>"geometry"}
    t.index ["fid"], name: "roman_scholarly_fid"
    t.index ["geometry"], name: "roman_scholarly_gist", using: :gist
    t.index ["language"], name: "roman_scholarly_language"
    t.index ["object_type"], name: "roman_scholarly_object_type"
  end

  create_table "sera_hermitage", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.string "shape_src", limit: 50
    t.string "name_src", limit: 50
    t.decimal "name"
    t.string "type", limit: 50
    t.integer "stories"
    t.string "url", limit: 50
    t.decimal "pd_id", precision: 10
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.index ["the_geom"], name: "sera_hermitage_the_geom_gist", using: :gist
    t.check_constraint "geometrytype(the_geom) = 'MULTIPOLYGON'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 32646", name: "enforce_srid_the_geom"
  end

  create_table "sera_hermitage_boundary", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.string "name", limit: 50
    t.decimal "pd_id", precision: 10
    t.string "shape_src", limit: 50
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.index ["the_geom"], name: "sera_hermitage_boundary_the_geom_gist", using: :gist
    t.check_constraint "geometrytype(the_geom) = 'MULTIPOLYGON'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 32646", name: "enforce_srid_the_geom"
  end

  create_table "sera_monastery_1966", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.decimal "pd_id"
    t.string "shape_src", limit: 50
    t.string "name_src", limit: 50
    t.string "type", limit: 50
    t.integer "stories"
    t.string "name", limit: 50
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.index ["the_geom"], name: "sera_monastery_1966_the_geom_gist", using: :gist
    t.check_constraint "geometrytype(the_geom) = 'MULTIPOLYGON'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 32646", name: "enforce_srid_the_geom"
  end

  create_table "sera_monastery_2003", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.decimal "pd_id"
    t.string "shape_src", limit: 50
    t.string "name_src", limit: 50
    t.string "type", limit: 50
    t.string "name", limit: 50
    t.integer "stories"
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.index ["the_geom"], name: "sera_monastery_2003_the_geom_gist", using: :gist
    t.check_constraint "geometrytype(the_geom) = 'MULTIPOLYGON'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 32646", name: "enforce_srid_the_geom"
  end

  create_table "sera_monastery_thl", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.string "shape_src", limit: 50
    t.string "name_src", limit: 50
    t.string "name", limit: 50
    t.integer "stories"
    t.string "type", limit: 50
    t.decimal "pd_id", precision: 10
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.index ["the_geom"], name: "sera_monastery_thl_the_geom_gist", using: :gist
    t.check_constraint "geometrytype(the_geom) = 'MULTIPOLYGON'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 32646", name: "enforce_srid_the_geom"
  end

  create_table "shapes", primary_key: "gid", id: :integer, default: -> { "nextval('features_gid_seq'::regclass)" }, force: :cascade do |t|
    t.geometry "geometry", limit: {:srid=>0, :type=>"geometry"}
    t.integer "fid"
    t.integer "position", default: 0, null: false
    t.float "area", limit: 24
    t.integer "altitude"
    t.boolean "is_public", default: true, null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index "geometrytype(geometry)", name: "shapes_geotype"
    t.index ["fid"], name: "shapes_fid"
    t.index ["geometry"], name: "features_geometry_gist", using: :gist
    t.check_constraint "st_ndims(geometry) = 2", name: "enforce_dims_geometry"
    t.check_constraint "st_srid(geometry) = 4326", name: "enforce_srid_geometry"
  end

  create_table "simple_chinese", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.integer "fid"
    t.integer "object_type"
    t.string "language", limit: 255
    t.string "name", limit: 255
    t.text "geotype"
    t.geometry "geometry", limit: {:srid=>0, :type=>"geometry"}
    t.index ["fid"], name: "simple_chinese_fid"
    t.index ["geometry"], name: "simple_chinese_gist", using: :gist
    t.index ["language"], name: "simple_chinese_language"
    t.index ["object_type"], name: "simple_chinese_object_type"
  end

  create_table "simple_props", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "code", limit: 255
    t.text "description"
    t.text "notes"
    t.string "type", limit: 255
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["code"], name: "simple_props_code_idx"
    t.index ["type"], name: "simple_props_type_idx"
  end

  create_table "structure_city", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.string "district", limit: 10
    t.integer "id"
    t.string "aufid", limit: 254
    t.string "shape_src", limit: 50
    t.string "name_src", limit: 50
    t.string "name", limit: 254
    t.integer "stories"
    t.decimal "type"
    t.string "url", limit: 50
    t.decimal "pd_id", precision: 10
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.index ["the_geom"], name: "structure_city_the_geom_gist", using: :gist
    t.check_constraint "geometrytype(the_geom) = 'MULTIPOLYGON'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 32646", name: "enforce_srid_the_geom"
  end

  create_table "structures_valley", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.string "shape_src", limit: 50
    t.string "name_src", limit: 50
    t.string "name", limit: 254
    t.integer "stories"
    t.decimal "type"
    t.decimal "pd_id", precision: 10
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.index ["the_geom"], name: "structures_valley_the_geom_gist", using: :gist
    t.check_constraint "geometrytype(the_geom) = 'MULTIPOLYGON'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 32646", name: "enforce_srid_the_geom"
  end

  create_table "summaries", id: :serial, force: :cascade do |t|
    t.integer "language_id", null: false
    t.text "content", null: false
    t.integer "author_id", null: false
    t.integer "feature_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "symbol_type", id: false, force: :cascade do |t|
    t.integer "object_type"
    t.string "symbol"
  end

  create_table "test2", id: false, force: :cascade do |t|
    t.serial "gid", null: false
    t.integer "fid"
    t.integer "object_type"
    t.string "language", limit: 255
    t.string "name", limit: 255
    t.text "geotype"
    t.geometry "geometry", limit: {:srid=>0, :type=>"geometry"}
    t.index ["fid"], name: "test2_fid"
    t.index ["geometry"], name: "test2_gist", using: :gist
    t.index ["language"], name: "test2_language"
    t.index ["object_type"], name: "test2_object_type"
  end

  create_table "tibetan_roman", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.integer "fid"
    t.integer "object_type"
    t.string "language", limit: 255
    t.string "name", limit: 255
    t.text "geotype"
    t.geometry "geometry", limit: {:srid=>0, :type=>"geometry"}
    t.index ["language"], name: "tibetan_roman_language"
    t.index ["object_type"], name: "tibetan_roman_object_type"
  end

  create_table "time_units", id: :serial, force: :cascade do |t|
    t.integer "date_id"
    t.integer "start_date_id"
    t.integer "end_date_id"
    t.integer "calendar_id"
    t.boolean "is_range"
    t.integer "dateable_id"
    t.string "dateable_type", limit: 255
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
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
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["dateable_id", "dateable_type"], name: "timespans_1_idx"
    t.index ["end_date"], name: "timespans_end_date_idx"
    t.index ["start_date"], name: "timespans_start_date_idx"
  end

  create_table "tlatlong", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.bigint "valueid"
    t.bigint "polyid"
    t.float "area"
    t.float "perimeter"
    t.integer "tlatlong#"
    t.integer "tlatlong-i"
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.check_constraint "geometrytype(the_geom) = 'POINT'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 4326", name: "enforce_srid_the_geom"
  end

  create_table "traditional_chinese", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.integer "fid"
    t.integer "object_type"
    t.string "language", limit: 255
    t.string "name", limit: 255
    t.text "geotype"
    t.geometry "geometry", limit: {:srid=>0, :type=>"geometry"}
    t.index ["fid"], name: "traditional_chinese_fid"
    t.index ["geometry"], name: "traditional_chinese_gist", using: :gist
    t.index ["language"], name: "traditional_chinese_language"
    t.index ["object_type"], name: "traditional_chinese_object_type"
  end

  create_table "trtibet", id: false, force: :cascade do |t|
    t.string "pc", limit: 1
    t.string "std", limit: 7
  end

  create_table "tsekor", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.integer "id"
    t.string "name", limit: 50
    t.string "name_src", limit: 50
    t.string "shape_src", limit: 50
    t.decimal "pd_id", precision: 10
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.index ["the_geom"], name: "tsekor_the_geom_gist", using: :gist
    t.check_constraint "geometrytype(the_geom) = 'MULTILINESTRING'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 32646", name: "enforce_srid_the_geom"
  end

  create_table "ulatlong", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.bigint "valueid"
    t.bigint "polyid"
    t.float "area"
    t.float "perimeter"
    t.integer "ulatlong#"
    t.integer "ulatlong-i"
    t.bigint "vugompa_"
    t.bigint "vugompa_id"
    t.decimal "h465utm_", precision: 20
    t.decimal "h465utm_id", precision: 20
    t.decimal "gis_id", precision: 20
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.check_constraint "geometrytype(the_geom) = 'POINT'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 4326", name: "enforce_srid_the_geom"
  end

  create_table "us_counties", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.string "statefp", limit: 2
    t.string "countyfp", limit: 3
    t.string "countyns", limit: 8
    t.string "affgeoid", limit: 14
    t.string "geoid", limit: 5
    t.string "name", limit: 100
    t.string "lsad", limit: 2
    t.float "aland"
    t.float "awater"
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.integer "fid"
    t.index ["the_geom"], name: "us_counties_the_geom_gist", using: :gist
    t.check_constraint "geometrytype(the_geom) = 'MULTIPOLYGON'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 4", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 4269", name: "enforce_srid_the_geom"
  end

  create_table "us_districts", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.string "statefp", limit: 2
    t.string "cd113fp", limit: 2
    t.string "affgeoid", limit: 13
    t.string "geoid", limit: 4
    t.string "lsad", limit: 2
    t.string "cdsessn", limit: 3
    t.float "aland"
    t.float "awater"
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.index ["the_geom"], name: "us_districts_the_geom_gist", using: :gist
    t.check_constraint "geometrytype(the_geom) = 'MULTIPOLYGON'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 4269", name: "enforce_srid_the_geom"
  end

  create_table "us_states", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.string "statefp", limit: 2
    t.string "statens", limit: 8
    t.string "affgeoid", limit: 11
    t.string "geoid", limit: 2
    t.string "stusps", limit: 2
    t.string "name", limit: 100
    t.string "lsad", limit: 2
    t.float "aland"
    t.float "awater"
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.index ["the_geom"], name: "us_states_the_geom_gist", using: :gist
    t.check_constraint "geometrytype(the_geom) = 'MULTIPOLYGON'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 4269", name: "enforce_srid_the_geom"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "login", limit: 255, null: false
    t.string "email", limit: 255, null: false
    t.integer "person_id", null: false
    t.string "crypted_password", limit: 40
    t.string "salt", limit: 40
    t.string "remember_token", limit: 255
    t.datetime "remember_token_expires_at", precision: nil
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "identity_url", limit: 255
    t.string "shibboleth_id", limit: 255
  end

  create_table "web_pages", id: :serial, force: :cascade do |t|
    t.string "path", limit: 255, null: false
    t.string "title", limit: 255, null: false
    t.integer "citation_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "xml_documents", id: :serial, force: :cascade do |t|
    t.integer "feature_id", null: false
    t.text "document", null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["feature_id"], name: "xml_documents_feature_id_idx"
  end

  create_table "zhol", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.string "district", limit: 10
    t.string "shape_src", limit: 50
    t.string "name_src", limit: 50
    t.string "type", limit: 50
    t.integer "stories"
    t.string "name", limit: 50
    t.string "url", limit: 50
    t.decimal "pd_id", precision: 10
    t.geometry "the_geom", limit: {:srid=>0, :type=>"geometry"}
    t.index ["the_geom"], name: "zhol_the_geom_gist", using: :gist
    t.check_constraint "geometrytype(the_geom) = 'MULTIPOLYGON'::text OR the_geom IS NULL", name: "enforce_geotype_the_geom"
    t.check_constraint "st_ndims(the_geom) = 2", name: "enforce_dims_the_geom"
    t.check_constraint "st_srid(the_geom) = 32646", name: "enforce_srid_the_geom"
  end

  add_foreign_key "essays", "features"
end
