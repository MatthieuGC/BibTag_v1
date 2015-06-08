json.array!(@headings) do |heading|
  json.extract! heading, :id, :heading_name, :facet_id
  json.url heading_url(heading, format: :json)
end
