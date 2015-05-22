class CreateSurrogateElements < ActiveRecord::Migration
  def change
    create_table :surrogate_elements do |t|
      t.string :field_name
      t.integer :surrogate_id

      t.timestamps null: false
    end
    add_index :surrogate_elements, :surrogate_id
  end
end
