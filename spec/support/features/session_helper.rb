module Features
  module SessionHelpers

    # Fill the form to sign in an user with email and password if provided
    # else (email and passwords are not provided) create a default user and log it
    #
    def sign_in(email=nil, password=nil)
      if email.blank? && password.blank?
        user     = create(:user)
        email    = user.email
        password = user.password
      end

      visit root_path

      fill_in 'user_email',    with: email
      fill_in 'user_password', with: password

      click_button I18n.t("devise.sessions.new.sign_in")
    end
  end
end
