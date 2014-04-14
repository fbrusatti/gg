# encoding: utf-8
require 'csv'
namespace :db do
  desc "Import Location from csv file"
  task :populate_locations => [:environment] do
    # configure
    # file = "your_path/cordoba_locations.csv"
    CSV.foreach(file, "r:ISO-8859-15:UTF-8") do |row|
      l = Location.new
      l.city = row[0].to_s
      l.state = "Córdoba"
      l.countri = "Argentina"
      if l.save
        puts "created Location number #{l.id}"
      else
        puts l.errors.inspect
      end
    end
  end
end