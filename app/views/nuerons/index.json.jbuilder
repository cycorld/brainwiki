json.nuerons @nuerons do |nueron|
  json.extract! nueron, :token, :title, :user_id
  json.uri show_path(nueron.token)
end

json.synapses @synapses do |synapse|
  json.extract! synapse, :origin_id, :next_id, :weight
end
