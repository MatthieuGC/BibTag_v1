class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :keywordName
      t.integer :surrogate_id

      t.timestamps null: false
    end
    add_index :keywords, :surrogate_id
  end
end
