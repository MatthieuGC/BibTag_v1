class RemoveFacetIdToHeading < ActiveRecord::Migration
  def change
   remove_column :headings, :facet_id
  end
end
