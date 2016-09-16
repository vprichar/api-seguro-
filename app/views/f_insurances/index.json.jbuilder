json.array!(@insurances) do |insurance|
  json.extract! insurance, :id, :name, :Description, :expiration
  json.url insurance_url(insurance, format: :json)
end
