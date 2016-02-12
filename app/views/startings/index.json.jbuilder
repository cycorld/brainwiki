json.array!(@startings) do |starting|
  json.extract! starting, :id, :nueron_id, :user_id, :title, :subtitle, :description
  json.url starting_url(starting, format: :json)
end
