class Bank < ActiveRecord::Base
  attr_accessible :name, :branch_office_number, :address ,:location_id

  # ==validations
  validates_presence_of :name, :branch_office_number, :address, :location

  belongs_to :location

  # == Callbacks
  before_save :not_exist_other, :name_upcase
  before_create :name_upcase
  def not_exist_other
    !(Bank.exists?(name: :name, branch_office_number: :branch_office_number))
  end

  def name_upcase
    self.name = self.name.upcase
  end

  def complete_name
    "#{name} (#{branch_office_number})"
  end
end
