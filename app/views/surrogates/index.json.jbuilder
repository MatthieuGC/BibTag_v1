json.array!(@surrogates) do |surrogate|
  json.extract! surrogate, :id
  json.url surrogate_url(surrogate, format: :json)
end
