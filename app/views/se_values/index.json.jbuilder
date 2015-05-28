json.array!(@se_values) do |se_value|
  json.extract! se_value, :id
  json.url se_value_url(se_value, format: :json)
end
