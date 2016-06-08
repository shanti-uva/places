# This migration comes from kmaps_engine_engine (originally 20160531170234)
class CreateCollectionsUsersJoinTable < ActiveRecord::Migration
  def change
    create_join_table :collections, :users do |t|
      # t.index [:collection_id, :user_id]
      t.index [:user_id, :collection_id], unique: true
    end
  end
end
