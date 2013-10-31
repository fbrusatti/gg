class Location < ActiveRecord::Base
  attr_accessible :city, :countri, :state



  before_save :not_repeat_city

  def not_repeat_city
    if !(Location.where("city= ? AND countri = ? AND state = ?",self.city, self.countri, self.state).empty?)
      errors.add(:city, I18n.t('activerecord.models.errors.message_location_insert'))
      false
    end
  end

  def complete_name
    "#{city} (#{state})"
  end
end
