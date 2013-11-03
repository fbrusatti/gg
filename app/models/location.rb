class Location < ActiveRecord::Base
  attr_accessible :city, :countri, :state

  validate :not_repeat_city

  def not_repeat_city
    if Location.where("city= ? AND countri = ? AND state = ?",self.city, self.countri, self.state).exists?
      errors.add(:city, I18n.t('activerecord.models.errors.message_location_insert'))
    end
  end

  def complete_name
    "#{city} (#{state})"
  end
end
