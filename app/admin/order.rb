ActiveAdmin.register Order do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :first_name, :last_name, :status, :phone, :address, :city,
                :country, :nip, :company, :email, :zip_code, :comment
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end



  filter :order_number
  filter :first_name
  filter :last_name
  filter :phone
  filter :address
  filter :city
  filter :country
  filter :nip
  filter :company
  filter :email
  filter :zip_code
  filter :total_price_in_int
  filter :total_shipment_price_in_int
  filter :payment_type
  filter :comment
  filter :created_at

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :status
    column :address
    column :city
    column :comment
    actions
  end

  show do
    attributes_table do
      row :order_number
      row :first_name
      row :last_name
      row :phone
      row :address
      row :city
      row :country
      row :nip
      row :company
      row :email
      row :zip_code
      row :total_price_in_int
      row :total_shipment_price_in_int
      row :payment_type
      row :comment
      row :created_at
    end
  end

  form html: { multipart: true } do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :status
      f.input :phone
      f.input :address
      f.input :city
      # f.input :country
      f.input :nip
      f.input :company
      f.input :email
      f.input :zip_code
      f.input :comment
    end
    f.actions
  end

end
