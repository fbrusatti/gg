class Card < ActiveRecord::Base

	# == Accessors
  attr_accessible :amount, :code, :expirate_at, :name, :number, :type_card, :annul

  # == Validations
  validates_presence_of :type_card, :name, :amount
  
  # == Associations
  belongs_to :document

end
