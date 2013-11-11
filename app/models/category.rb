class Category < ActiveRecord::Base

  # == Accesors
  attr_accessible :name, :referrer_id, :referrer

  # == Associations
  belongs_to :referrer, :class_name => 'Category'
  has_many :referrals, :foreign_key => :referrer_id,
                       :class_name  => 'Category'
  has_and_belongs_to_many :products

  # == Validations
  validates_presence_of :name

end
