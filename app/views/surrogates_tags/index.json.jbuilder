json.array!(@surrogates_tags) do |surrogates_tag|
  json.extract! surrogates_tag, :id
  json.url surrogates_tag_url(surrogates_tag, format: :json)
end
