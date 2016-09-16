json.array!(@devices) do |device|
  json.extract! device, :id, :iddevices
  json.url device_url(device, format: :json)
end
