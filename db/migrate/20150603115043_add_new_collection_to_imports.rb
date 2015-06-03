class AddNewCollectionToImports < ActiveRecord::Migration
  def change
    add_column :imports, :new_collection, :string
  end
end
