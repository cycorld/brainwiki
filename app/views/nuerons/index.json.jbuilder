json.array!(@nuerons) do |nueron|
  json.extract! nueron, :id, :user_id, :title, :vid, :note
  json.url nueron_url(nueron, format: :json)
end
