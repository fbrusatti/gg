namespace :db do
  desc "Fill database with differents types for money."
  task :fill_money => :environment do
    %w{ARG Dolar}.each { |n| Money.create(name: n, symbol: '$', quotation: 0) }
  end

  desc "Fill database with differents vat."
  task :fill_vat => :environment do
    %w{0 10.5 21}.each { |p| Vat.create(percentaje: p) }
  end

  desc "Fill database with differents vat and differents types for money."
  task :fill_money_vat => [:fill_money, :fill_vat]
end
