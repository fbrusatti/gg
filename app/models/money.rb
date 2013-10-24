class Money < ActiveRecord::Base
  attr_accessible :name, :quotation, :symbol, :id

  # == Validations
  validates_presence_of :name, :quotation, :symbol

  def complete_name
    "#{symbol} #{name}"
  end
end
