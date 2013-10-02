module CustomersHelper
  
  TYPE_PERSON     = %W{customer supplier}
  TYPE_IVA        = %w{non_registered_taxpayer tax_exempt monotributista registered_taxpayer}

  def type_iva_meth
    CustomersHelper::TYPE_IVA.map { |i| [t("customers.type_iva.#{i}"), i] } 
  end
end
