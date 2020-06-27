json.extract! artikel, :id, :judul, :konten, :created_at, :updated_at
json.url artikel_url(artikel, format: :json)
