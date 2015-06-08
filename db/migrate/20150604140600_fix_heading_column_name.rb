class FixHeadingColumnName < ActiveRecord::Migration
  def change
    rename_column :headings, :facet_id, :facet_leaf_id
  end
end
