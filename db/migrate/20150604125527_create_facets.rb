class CreateFacets < ActiveRecord::Migration
  def change
    create_table :facets do |t|
      t.string :facet_name

      t.timestamps null: false
    end
  end
end
