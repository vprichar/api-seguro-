class CustomerSerializer < ActiveModel::Serializer
  attributes  :id, :name ,:daten ,:usertoken ,:phone , :insurance
end
