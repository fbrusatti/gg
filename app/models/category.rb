class Category < ActiveRecord::Base
  
  # == Accesors
  attr_accessible :name, :referrer_id

  # == Associations
  belongs_to :referrer, :class_name => 'Category'
  has_many :referrals, :foreign_key => :referrer_id, 
                       :class_name  => 'Category'

  # == Validations
  validates_presence_of :name                     

end
