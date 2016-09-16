json.array!(@campaigns) do |campaign|
  json.extract! campaign, :id, :name, :body, :sent, :successful, :error
  json.url campaign_url(campaign, format: :json)
end
