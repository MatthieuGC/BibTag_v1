class CreateSurrogateElements < ActiveRecord::Migration
  def change
    create_table :surrogate_elements do |t|
      t.string :name
      t.string :field
      t.string :arrayValues

      t.timestamps null: false
    end
  end
end
