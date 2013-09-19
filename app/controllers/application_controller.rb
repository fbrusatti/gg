class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    if resource.is_a?(AdminUser)
      admin_dashboard_path
    else
      landing_page_path
    end
  end
end
