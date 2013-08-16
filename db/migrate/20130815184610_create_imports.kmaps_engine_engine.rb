# This migration comes from kmaps_engine_engine (originally 20130815184322)
class CreateImports < ActiveRecord::Migration
  def change
    create_table :imports do |t|
      t.integer :spreadsheet_id, :null => false
      t.integer :item_id, :null => false
      t.string :item_type, :null => false

      t.timestamps
    end
  end
end
