class CreateSurrogateElements < ActiveRecord::Migration
  def change
    create_table :surrogate_elements do |t|
      t.string :name
      t.string :field
      t.string :arrayValues
      t.string :surrogate_id

      t.timestamps null: false
    end
    add_index :surrogate_elements, :surrogate_id
  end
end
