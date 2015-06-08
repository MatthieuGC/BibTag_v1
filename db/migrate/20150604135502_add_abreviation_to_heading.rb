class AddAbreviationToHeading < ActiveRecord::Migration
  def change
    add_column :headings, :abbreviation, :string
  end
end
