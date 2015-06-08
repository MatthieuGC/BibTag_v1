class CreateFacetLeafs < ActiveRecord::Migration
  def change
    create_table :facet_leafs do |t|
      t.integer :facet_id

      t.timestamps null: false
    end
  end
end
