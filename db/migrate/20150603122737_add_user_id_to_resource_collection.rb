class AddUserIdToResourceCollection < ActiveRecord::Migration
  def change
    add_column :resource_collections, :user_id, :integer
  end
end
