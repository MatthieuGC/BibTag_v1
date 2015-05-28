json.array!(@resource_collections) do |resource_collection|
  json.extract! resource_collection, :id
  json.url resource_collection_url(resource_collection, format: :json)
end
