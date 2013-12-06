class Check < ActiveRecord::Base

  # == Accesors
  attr_accessible :check_number , :account, :emission_date, :payment_date, 
                  :emisor, :amount, :check_status ,:is_proper ,:bank_id


  # ==validations
  validates_presence_of :check_number, :emisor, :amount, :emission_date, 
                        :payment_date
  validate :correct_date

  # ==Associations
  belongs_to :bank
  belongs_to :document

  def correct_date
    if emission_date > payment_date
      errors.add(:emission_date, I18n.t('activerecord.models.errors.message_check_date'))
    end
  end

end
