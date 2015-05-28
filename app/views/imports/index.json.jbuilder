json.array!(@imports) do |import|
  json.extract! import, :id
  json.url import_url(import, format: :json)
end
