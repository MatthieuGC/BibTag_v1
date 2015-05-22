class CreateResourceCollections < ActiveRecord::Migration
  def change
    create_table :resource_collections do |t|
      t.string :collection_name

      t.timestamps null: false
    end
  end
end
