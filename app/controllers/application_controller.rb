class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :redirect_to_subdomain

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :subdomain])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :subdomain])
    end

  private

    # be sure user stay in their subdomain - even if they try to switch
    def redirect_to_subdomain
      return if self.is_a?(DeviseController)
      if current_user.present? && (request.subdomain != current_user.subdomain)
        redirect_to workouts_url(subdomain: current_user.subdomain)
      end
    end

    # on signin - redirect users to their subdomain
    def after_sign_in_path_for(resource_or_scope)
      root_url(subdomain: resource_or_scope.subdomain)
    end

end
