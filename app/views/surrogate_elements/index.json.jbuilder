json.array!(@surrogate_elements) do |surrogate_element|
  json.extract! surrogate_element, :id
  json.url surrogate_element_url(surrogate_element, format: :json)
end
