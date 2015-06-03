class AddCollectionIdToImports < ActiveRecord::Migration
  def change
    add_column :imports, :collection_id, :integer
  end
end
