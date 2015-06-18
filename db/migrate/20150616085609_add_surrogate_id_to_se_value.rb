class AddSurrogateIdToSeValue < ActiveRecord::Migration
  def change
    add_column :se_values, :surrogate_id, :integer
  end
end
