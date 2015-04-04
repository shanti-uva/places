# This migration comes from kmaps_engine_engine (originally 20150402060417)
class AddInfoSourceTypeToCitation < ActiveRecord::Migration
  def up
    add_column :citations, :info_source_type, :string
    Citation.update_all info_source_type: 'MmsIntegration::Medium'
    change_column :citations, :info_source_type, :string, null: false
  end
  
  def down
    remove_column :citations, :info_source_type
  end
  
end
