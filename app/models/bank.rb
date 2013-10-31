class Bank < ActiveRecord::Base
  attr_accessible :name, :branch_office_number, :address ,:location_id

  # ==validations
  validates_presence_of :name, :branch_office_number, :address, :location

  belongs_to :location

  # == Callbacks
  before_save :not_exist_other, :name_upcase

  def not_exist_other
    if !(Bank.where("name= ? AND branch_office_number = ?",self.name, self.branch_office_number).empty?)
      errors.add(:complete_name,I18n.t('activerecord.models.errors.message_bank_insert'))
      false
    end
  end

  def name_upcase
    self.name = self.name.upcase
  end

  def complete_name
    "#{name} (#{branch_office_number})"
  end
end
