class CreateSurrogatesTags < ActiveRecord::Migration
  def change
    create_table :surrogates_tags, :id => false do |t|
      t.integer :surrogate_id
      t.integer :tag_id
    end
  end
end
