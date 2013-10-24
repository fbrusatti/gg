require 'spec_helper'
include ProductSteps

feature "Product" do 

  background do
    @vat = FactoryGirl.create(:vat)
    @category = FactoryGirl.create(:category)
    @current_user = FactoryGirl.create(:user)
    login_as(@current_user, scope: :user)
  end

  context "Creating a product" do

    scenario "User create a new product", js: true do
      visit new_product_path
      within new_product_form do
        fill_in 'product_code',           with: '0001' 
        fill_in 'product_description',    with: 'Mouse optico'
        fill_in 'product_stock',          with: '10'
        fill_in 'product_minimun_stock',  with: '2'
        fill_in 'product_gondola',        with: 'A'
        fill_in 'product_shelf',          with: '3'
        fill_in 'product_cost_price',     with: '50.5'
        fill_in 'product_list_price_one', with: '119'
        fill_in 'product_list_price_two', with: '130.5'
        page.select 'Informatica',        from: 'product_category_id'
        page.select '1.5',                from: 'product_vat_id'
      end  
      product_save_button.click
      page.should have_content I18n.t('flash.product',
                                       message: I18n.t('flash.created'),
                                       locale: 'es')
    end 

    scenario "When code and minimun stock are no present", js: true do
      visit new_product_path
      within new_product_form do
        fill_in 'product_description',    with: 'Mouse optico'
        fill_in 'product_stock',          with: '10'
        fill_in 'product_minimun_stock',  with: '2'
        fill_in 'product_gondola',        with: 'A'
        fill_in 'product_shelf',          with: '3'
        fill_in 'product_cost_price',     with: '50.5'
        fill_in 'product_list_price_one', with: '119'
        fill_in 'product_list_price_two', with: '130.5'
        page.select 'Informatica',        from: 'product_category_id'
        page.select '1.5',                from: 'product_vat_id'
      end  
      product_save_button.click
      page.should have_content I18n.t('flash.error_create_form',
                                       locale: 'es')
    end   
  end

  context "Editing Product" do

    background do
      @product = FactoryGirl.create(:product)
    end

    scenario "Update some attributes", js: true do
      visit edit_product_path @product
      within edit_product_form do
        fill_in 'product_code',           with: '10001' 
        fill_in 'product_description',    with: 'Mouse optico genius'
        fill_in 'product_cost_price',     with: '55.5'
        fill_in 'product_list_price_one', with: '130'
        fill_in 'product_list_price_two', with: '140.5'
      end  
      product_save_button.click
      page.should have_content I18n.t('flash.product',
                                       message: I18n.t('flash.updated'),
                                       locale: 'es')
    end 
      
    scenario "When minimun stock is changed to blank", js: true do
      visit edit_product_path @product
      within edit_product_form do
        fill_in 'product_minimun_stock',  with: ''
        fill_in 'product_gondola',        with: 'B'
        fill_in 'product_cost_price',     with: '55.5'
        fill_in 'product_list_price_one', with: '140'
      end  
      product_save_button.click
      page.should have_content I18n.t('flash.error_update_form',
                                       locale: 'es')
    end

  end  
end  