ActiveAdmin.register Customer do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do


  #permitted = [:name, :daten,:email,:usertoken,:phone]
   permit_params :name, :daten,:email,:usertoken,:phone

#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
