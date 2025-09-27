# This migration comes from authenticated_system_engine (originally 20250926172030)
class AddPasswordDigestToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :password_digest, :string
    add_index  :users, :password_digest
    add_index :users, :remember_token
  end
end
