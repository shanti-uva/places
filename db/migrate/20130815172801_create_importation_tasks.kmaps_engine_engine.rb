# This migration comes from kmaps_engine_engine (originally 20130814231253)
class CreateImportationTasks < ActiveRecord::Migration
  def change
    create_table :importation_tasks do |t|
      t.string :task_code, :null => false

      t.timestamps
    end
  end
end
