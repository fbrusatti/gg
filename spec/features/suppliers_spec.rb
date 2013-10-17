require 'spec_helper'
include SupplierSteps

feature "Supplier" do 

  background do
    @current_user = FactoryGirl.create(:user)
    login_as(@current_user, scope: :user)
  end

  context "Creating a supplier" do

    scenario "User create a new supplier", js: true do
      visit new_supplier_path
      within new_supplier_form do
        fill_in 'supplier_name',            with: 'Bill'
        fill_in 'supplier_surname',         with: 'Gates'
        fill_in 'supplier_dni',             with: '25123321'
        fill_in 'supplier_cuit_cuil',       with: '20-25123321-9'
        fill_in 'supplier_address',         with: 'Silicon Valey 777'
        fill_in 'supplier_email',           with: 'bill_el_mas_capito@gmail.com'
        fill_in 'supplier_phone',           with: '012-4624975'
        fill_in 'supplier_mobile_phone',    with: '012-154937851'
        fill_in 'supplier_gross_income',    with: '5000000.00'
        fill_in 'supplier_registered_name', with: 'Multimillonario'
        page.select 'Consumidor Final',     from: 'supplier_type_iva'
      end  
      supplier_save_button.click
      page.should have_content I18n.t('flash.supplier',
                                       message: I18n.t('flash.created'),
                                       locale: 'es')
    end  
  end

  context "When name and surname are not present" do

    scenario "name are not present", js: true do  
      visit new_supplier_path
      within new_supplier_form do
        fill_in 'supplier_surname',         with: 'Gates'
        fill_in 'supplier_dni',             with: '25123321'
        fill_in 'supplier_cuit_cuil',       with: '20-25123321-9'
        fill_in 'supplier_address',         with: 'Silicon Valey 777'
        fill_in 'supplier_email',           with: 'bill_el_mas_capito@gmail.com'
        fill_in 'supplier_phone',           with: '012-4624975'
        fill_in 'supplier_mobile_phone',    with: '012-154937851'
        fill_in 'supplier_gross_income',    with: '5000000.00'
        fill_in 'supplier_registered_name', with: 'Multimillonario'
        page.select 'Consumidor Final',     from: 'supplier_type_iva'
      end  
      supplier_save_button.click
      page.should have_content I18n.t('flash.error_create_form',
                                       locale: 'es')
    end
  end

  context "Editing supplier" do

    background do
      @supplier = FactoryGirl.create(:supplier)
    end

    scenario "Update an attribute", js: true do
      visit edit_supplier_path @supplier
      within edit_supplier_form do
        fill_in 'supplier_email', with: 'odio_a_jobs@gmail.com'
        fill_in 'supplier_phone', with: '012-462412987'
      end
      supplier_save_button.click
      page.should have_content I18n.t('flash.supplier',
                                       message: I18n.t('flash.updated'),
                                       locale: 'es')  
    end

    scenario "When name is changes to blank", js: true do
      visit edit_supplier_path @supplier
      within edit_supplier_form do
        fill_in 'supplier_name', with: ''
      end
      supplier_save_button.click
      page.should have_content I18n.t('flash.error_update_form',
                                       locale: 'es')  
    end  
  end    
end
