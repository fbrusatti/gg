module SupplierSteps
  def new_supplier_form
    find '#new_supplier'
  end

  def supplier_save_button
    find '.sub-header a.supplier-save'
  end

  def edit_supplier_form
    find '.edit_supplier'
  end
end
