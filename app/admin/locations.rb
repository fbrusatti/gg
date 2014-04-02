ActiveAdmin.register Location do
  index do
    column :city
    column :state
    column :countri
    column :zipcode
    default_actions
  end

  filter :state 
  filter :countri 
  filter :city
  filter :zipcode
end
