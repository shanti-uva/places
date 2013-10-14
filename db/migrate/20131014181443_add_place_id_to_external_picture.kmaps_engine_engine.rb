# This migration comes from kmaps_engine_engine (originally 20131012020944)
class AddPlaceIdToExternalPicture < ActiveRecord::Migration
  def change
    add_column :external_pictures, :place_id, :integer
  end
end
