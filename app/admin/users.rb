ActiveAdmin.register User do
   index do
    column :email
    column :created_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
   end

  filter :email

  form do |f|
    f.inputs I18n.t("active_admin.details_user") do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
