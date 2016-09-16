class CampaignSerializer < ActiveModel::Serializer
  attributes :id, :name, :body, :sent, :successful, :error
end
