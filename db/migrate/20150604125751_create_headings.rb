class CreateHeadings < ActiveRecord::Migration
  def change
    create_table :headings do |t|
      t.string :heading_name
      t.integer :facet_leaf_id

      t.timestamps null: false
    end
  end
end
