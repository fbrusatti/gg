class Location < ActiveRecord::Base
  attr_accessible :city, :countri, :state

  def complete_name
    "#{city} (#{state})"
  end
end
