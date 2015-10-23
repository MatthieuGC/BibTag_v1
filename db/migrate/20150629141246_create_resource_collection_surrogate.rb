class CreateResourceCollectionSurrogate < ActiveRecord::Migration
  def change
    create_table :resource_collections_surrogates, id: false do |t|
      t.belongs_to :resource_collection, index: { name: "res_col_srg_index" }
      t.belongs_to :surrogate, index: true
    end
  end
end
