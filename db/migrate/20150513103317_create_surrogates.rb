class CreateSurrogates < ActiveRecord::Migration
  def change
    create_table :surrogates do |t|
      t.string :entry_type
      t.string :entry_key
      t.string :doi
      t.string :url
      t.integer :resource_collection_id

      t.timestamps null: false
    end
    add_index :surrogates, :resource_collection_id
  end
end
