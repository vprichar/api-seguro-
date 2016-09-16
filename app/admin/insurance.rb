ActiveAdmin.register Insurance do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


 permit_params :name, :Description,:Description,:insured_name, :policy,:customer_id,:expiration, :emergency,:refname,:features,:customer


  form do |f|
    f.inputs "Detalles de usuario" do
      f.input :customer, label: "cliente"
      f.input :name ,label: "Provider"
      f.input :Description,label: "Insurance name"
      f.input :insured_name
      f.input :policy
      f.input :expiration
      f.input  :emergency
      f.input  :refname,label: "Reference"
    #  f.input  :features
      f.input :features, :as => :ckeditor,label: "Features"
    end
    f.actions
  end


   index :title => 'Detalles de usuario' do
    selectable_column
    id_column  
    column "Provider",:name
    column "expiration",:expiration
    column "cliente" ,:customer
    column "Reference",:refname
    actions
  end



end
