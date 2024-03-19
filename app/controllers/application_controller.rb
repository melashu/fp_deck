# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up,
                                          keys: %i[email password password_confirmation first_name last_name role])
        devise_parameter_sanitizer.permit(:sign_in, keys: %i[email password])
        devise_parameter_sanitizer.permit(:account_update,
                                          keys: %i[email password password_confirmation first_name last_name role])
      end
end
