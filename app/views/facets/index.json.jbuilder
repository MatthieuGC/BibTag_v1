json.array!(@facets) do |facet|
  json.extract! facet, :id, :facet_name
  json.url facet_url(facet, format: :json)
end
