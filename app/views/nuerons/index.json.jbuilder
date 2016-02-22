check = {}
count = 0
json.nuerons @nuerons do |nueron|
  unless check.has_key?(nueron.tag_list[0])
    count = count+1
    check[nueron.tag_list[0]] = count
    nueron.tag_list = check[nueron.tag_list[0]]
  else
    nueron.tag_list = check[nueron.tag_list[0]]
  end
  json.extract! nueron, :token, :title, :user_id, :tag_list
  json.uri show_path(nueron.token)
end

json.synapses @synapses do |synapse|
  json.extract! synapse, :origin_id, :next_id, :weight
end
