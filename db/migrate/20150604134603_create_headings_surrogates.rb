class CreateHeadingsSurrogates < ActiveRecord::Migration
  def change
    create_table :headings_surrogates, id: false do |t|
      t.belongs_to :heading, index: true
      t.belongs_to :surrogate, index: true
    end
  end
end
