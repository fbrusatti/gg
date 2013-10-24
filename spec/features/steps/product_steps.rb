module ProductSteps
  def new_product_form
    find '#new_product'
  end

  def product_save_button
    find '.sub-header a.product-save'
  end

  def edit_product_form
    find '.edit_product'
  end
end