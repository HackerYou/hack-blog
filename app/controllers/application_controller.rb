class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(user)
    if user.name == "Brad Robertson"
      dashboard_admin_path
    else
      dashboard_normy_path
    end
    # dashboard_path
  end
end
