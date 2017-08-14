ActiveAdmin.register Product do
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

  menu priority: 2, label: proc{ I18n.t("active_admin.products") }

  show do |ad|
    attributes_table do
      row :name
      row :product_image do
        image_tag ad.product_image.url(:thumb)
      end
      row :price_in_int
      row :description
      row :only_on_demand
      row :in_magazine
      row :shipment_price_in_int
      row :width
      row :height
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :price_in_int
    column :category
    column :created_at
    actions
  end

end
