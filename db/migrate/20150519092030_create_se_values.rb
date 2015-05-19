class CreateSeValues < ActiveRecord::Migration
  def change
    create_table :se_values do |t|
      t.string :value
      t.integer :surrogate_element_id

      t.timestamps null: false
    end
  end
end
