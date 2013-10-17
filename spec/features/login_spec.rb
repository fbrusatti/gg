require 'spec_helper'

feature "Login" do
  scenario "with valid credentials" do
    user = create(:user)
    sign_in user.email, user.password

    page.should have_content(I18n.t('layouts.header.exit', locale: 'es'))
  end

  scenario "with invalid credentials" do
    user = FactoryGirl.create(:user)
    sign_in user.email, 'invalid password'

    page.should_not have_content(I18n.t('layouts.header.exit', locale: 'es'))
  end
end
