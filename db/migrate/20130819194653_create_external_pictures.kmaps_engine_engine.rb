# This migration comes from kmaps_engine_engine (originally 20130816182248)
class CreateExternalPictures < ActiveRecord::Migration
  def change
    create_table :external_pictures do |t|
      t.string :url, :null => false
      t.text :caption

      t.timestamps
    end
  end
end
