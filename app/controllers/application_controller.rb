class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def after_sign_in_path_for(resource)

    if current_user.sign_in_count == 0
      flash[:notice] = "Welcome, #{current_user.first_name} #{current_user.last_name}!"
    end

    if current_user.is_a?(Admin)
      admin_tests_path
    else
      tests_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end

end
