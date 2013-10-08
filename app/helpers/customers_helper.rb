module CustomersHelper
  
  TYPE_IVA        = %w{non_registered_taxpayer tax_exempt monotributista registered_taxpayer}

  def type_iva_meth
    TYPE_IVA.map { |i| [t("customers.type_iva.#{i}"), t("customers.type_iva.#{i}")] } 
  end
end
