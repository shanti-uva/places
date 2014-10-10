# This migration comes from places_engine_engine (originally 20140816062357)
class EnablePostgis < ActiveRecord::Migration
  def change
    enable_extension :postgis
  end
end
