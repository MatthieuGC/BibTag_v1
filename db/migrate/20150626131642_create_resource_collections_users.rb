class CreateResourceCollectionsUsers < ActiveRecord::Migration
  def change
    create_table :resource_collections_users, id: false do |t|
      t.belongs_to :resource_collection, index: true
      t.belongs_to :user, index: true
    end
  end
end
