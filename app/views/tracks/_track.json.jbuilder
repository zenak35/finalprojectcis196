json.extract! track, :id, :name, :artist_id, :created_at, :updated_at
json.url track_url(track, format: :json)
