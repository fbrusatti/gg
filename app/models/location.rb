class Location < ActiveRecord::Base
  attr_accessible :city, :countri, :state



  before_save :not_repeat_city

  def not_repeat_city
    if !(Location.where("city= ? AND countri = ? AND state = ?",self.city, self.countri, self.state).empty?)
      errors.add(:city, "La localidad ya esta ingresada")
    end
  end

  def complete_name
    "#{city} (#{state})"
  end
end
