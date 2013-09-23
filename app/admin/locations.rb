ActiveAdmin.register Location do
  index do
    column :city
    column :state
    column :countri
    default_actions
  end

  filter :state 
  filter :countri 
  filter :city
end
