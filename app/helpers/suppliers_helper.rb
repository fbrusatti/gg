module SuppliersHelper

  TYPE_PERSON     = %W{customer supplier}
  TYPE_IVA        = %w{non_registered_taxpayer tax_exempt monotributista registered_taxpayer}

  def type_iva_meth
    SuppliersHelper::TYPE_IVA.map { |i| [t("suppliers.type_iva.#{i}"), i] } 
  end

end
