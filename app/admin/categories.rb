ActiveAdmin.register Category do

  index do
    column :id
    column :name
    column :referrer_id
    column :created_at
    default_actions
  end

  filter :referrer_id
  filter :name
  
end
