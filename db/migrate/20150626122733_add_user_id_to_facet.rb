class AddUserIdToFacet < ActiveRecord::Migration
  def change
    add_column :facets, :user_id, :integer
  end
end
