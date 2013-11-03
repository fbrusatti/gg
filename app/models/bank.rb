class Bank < ActiveRecord::Base
  attr_accessible :name, :branch_office_number, :address ,:location_id

  # ==validations
  validates_presence_of :name, :branch_office_number, :address, :location
  validate :not_exist_same

  belongs_to :location

  # == Callbacks
  before_save :name_upcase

  def not_exist_same
    if Bank.where("name= ? AND branch_office_number = ?",self.name, self.branch_office_number).exists?
      errors.add(:complete_name,I18n.t('activerecord.models.errors.message_bank_insert'))
    end
  end

  def name_upcase
    self.name = self.name.upcase
  end

  def complete_name
    "#{name} (#{branch_office_number})"
  end
end
