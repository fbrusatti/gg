ActiveAdmin.register Money do

  index do
    column :id
    column :name
    column :quotation
    column :symbol
    column :created_at
    default_actions
  end

  filter :name

end
