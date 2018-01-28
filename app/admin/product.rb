ActiveAdmin.register Product do
 # extend Modules::Structures
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
  filter :name
  filter :price_in_int
  filter :shipment_price_in_int
  filter :category, as: :select, collection: Product::CATEGORIES
  filter :in_magazine, as: :select, collection: Modules::Structures.yes_no_select
  filter :created_at
  filter :updated_at

  menu priority: 2, label: proc {I18n.t("active_admin.products")}

  show do |product|
    attributes_table do
      row :name
      row :product_image do
        image_tag product.product_image.url(:thumb)
      end
      row :price_in_int
      row :description
      row :only_on_demand
      row :in_magazine
      row :category do
        I18n.t("categories.#{product.category}")
      end
      row :shipment_price_in_int
      row :width
      row :height
      row :updated_at
      row :created_at
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :price_in_int
    column :category do |product|
      I18n.t("categories.#{product.category}")
    end
    column :created_at
    actions
  end

  form html: { multipart: true } do |f|
    f.inputs do
      f.input :name
      f.input :product_image, type: :file
      f.input :price_in_int
      f.input :category, as: :select,
              collection: collection_of_categories,
              include_blank: false
    end
    f.actions
  end

end
