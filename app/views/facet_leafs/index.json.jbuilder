json.array!(@facet_leafs) do |facet_leaf|
  json.extract! facet_leaf, :id, :facet_id
  json.url facet_leaf_url(facet_leaf, format: :json)
end
