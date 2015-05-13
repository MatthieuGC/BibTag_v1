class CreateSurrogates < ActiveRecord::Migration
  def change
    create_table :surrogates do |t|
      t.string :name
      t.string :doi
      t.string :url

      t.timestamps null: false
    end
  end
end
