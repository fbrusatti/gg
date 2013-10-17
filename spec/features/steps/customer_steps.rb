module CustomerSteps
  def new_customer_form
    find '#new_customer'
  end

  def customer_save_button
    find '.sub-header a.customer-save'
  end

  def edit_customer_form
    find '.edit_customer'
  end
end
