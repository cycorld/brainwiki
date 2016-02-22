check = {}
count = 0
json.nuerons @nuerons do |nueron|
  unless check.has_key?(nueron.tag_list)
    count = count+1
    check[nueron.tag_list] = count
    nueron.tag_list = check[nueron.tag_list]
  else
    nueron.tag_list = check[nueron.tag_list]
  end
  json.extract! nueron, :token, :title, :user_id, :tag_list
  json.uri show_path(nueron.token)
end

json.synapses @synapses do |synapse|
  json.extract! synapse, :origin_id, :next_id, :weight
end
