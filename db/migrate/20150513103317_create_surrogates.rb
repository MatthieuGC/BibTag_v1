class CreateSurrogates < ActiveRecord::Migration
  def change
    create_table :surrogates do |t|
      t.string :entry_type
      t.string :entry_key
      t.string :doi
      t.string :url

      t.timestamps null: false
    end
  end
end
