json.array!(@contatti) do |contatto|
  json.extract! contatto, :id
  json.url contatto_url(contatto, format: :json)
end
