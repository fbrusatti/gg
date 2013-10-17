require 'spec_helper'
include CustomerSteps

feature "Customer" do 

  background do
    @current_user = FactoryGirl.create(:user)
    login_as(@current_user, scope: :user)
  end

  context "Creating a customer" do

    scenario "User create a new customer", js: true do
      visit new_customer_path
      within new_customer_form do
        fill_in 'customer_name',            with: 'Bill'
        fill_in 'customer_surname',         with: 'Gates'
        fill_in 'customer_dni',             with: '25123321'
        fill_in 'customer_cuit_cuil',       with: '20-25123321-9'
        fill_in 'customer_address',         with: 'Silicon Valey 777'
        fill_in 'customer_email',           with: 'bill_el_mas_capito@gmail.com'
        fill_in 'customer_phone',           with: '012-4624975'
        fill_in 'customer_mobile_phone',    with: '012-154937851'
        fill_in 'customer_gross_income',    with: '5000000.00'
        fill_in 'customer_registered_name', with: 'Multimillonario'
        page.select 'Consumidor Final',     from: 'customer_type_iva'
      end  
      customer_save_button.click
      page.should have_content I18n.t('flash.customer',
                                       message: I18n.t('flash.created'),
                                       locale: 'es')
    end  
  end

  context "When name, surname and phone are not present" do

    scenario "name are not present", js: true do  
      visit new_customer_path
      within new_customer_form do
        fill_in 'customer_surname',         with: 'Gates'
        fill_in 'customer_dni',             with: '25123321'
        fill_in 'customer_cuit_cuil',       with: '20-25123321-9'
        fill_in 'customer_address',         with: 'Silicon Valey 777'
        fill_in 'customer_email',           with: 'bill_el_mas_capito@gmail.com'
        fill_in 'customer_phone',           with: '012-4624975'
        fill_in 'customer_mobile_phone',    with: '012-154937851'
        fill_in 'customer_gross_income',    with: '5000000.00'
        fill_in 'customer_registered_name', with: 'Multimillonario'
        page.select 'Consumidor Final',     from: 'customer_type_iva'
      end  
      customer_save_button.click
      page.should have_content I18n.t('flash.error_create_form',
                                       locale: 'es')
    end
  end

  context "Editing customer" do

    background do
      @customer = FactoryGirl.create(:customer)
    end

    scenario "Update an attribute", js: true do
      visit edit_customer_path @customer
      within edit_customer_form do
        fill_in 'customer_email', with: 'odio_a_jobs@gmail.com'
        fill_in 'customer_phone', with: '012-462412987'
      end
      customer_save_button.click
      page.should have_content I18n.t('flash.customer',
                                       message: I18n.t('flash.updated'),
                                       locale: 'es')  
    end

    scenario "When name is changes to blank", js: true do
      visit edit_customer_path @customer
      within edit_customer_form do
        fill_in 'customer_name', with: ''
      end
      customer_save_button.click
      page.should have_content I18n.t('flash.error_update_form',
                                       locale: 'es')  
    end  
  end    
end
