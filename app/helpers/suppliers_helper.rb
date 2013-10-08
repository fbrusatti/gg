module SuppliersHelper

  TYPE_IVA        = %w{non_registered_taxpayer tax_exempt monotributista registered_taxpayer}

  def type_iva_meth
    TYPE_IVA.map  { |i| [t("suppliers.type_iva.#{i}"), t("suppliers.type_iva.#{i}")] }
  end

end
