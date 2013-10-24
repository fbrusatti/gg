class Document < ActiveRecord::Base
  # == Accesors
  attr_accessible :type, :number, :recharge, :amount, :balance, :state,
                  :expiration_date, :payment_condition, :active, :annul
  # == Associations
  belongs_to :customer
  belongs_to :user
  belongs_to :supplier
end
