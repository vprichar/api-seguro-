json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :daten, :email, :usertoken, :phone
  json.url customer_url(customer, format: :json)
end
