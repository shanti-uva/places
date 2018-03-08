# This migration comes from kmaps_engine_engine (originally 20180215130314)
class ChangeCitationIdToNotNullForPage < ActiveRecord::Migration[5.1]
  def up
    change_column :pages, :citation_id, :integer, null: false
  end
  def down
    change_column :pages, :citation_id, :integer
  end
end
