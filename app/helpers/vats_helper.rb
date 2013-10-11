module VatsHelper

  def vat_meth
    Vat.all.map { |v| [v.percentaje, v.id]  }
  end

end
