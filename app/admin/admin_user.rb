ActiveAdmin.register AdminUser do
  role_changeable
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  show do
    attributes_table do
      row :email
      # row :reset_password_sent_at
      # row :current_sign_in
      # row :last_sign_in
      row :created_at
      row :updated_at
      row :confirmation_sent_at
      row :confirmed_at
      row :role
    end
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
