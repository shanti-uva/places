# This migration comes from kmaps_engine_engine (originally 20131022201607)
class ChangeCaptionToText < ActiveRecord::Migration
  def up
    change_column :captions, :content, :text, :null => false
  end

  def down
    change_column :captions, :content, :string, :null => false, :limit => 150
  end
end
