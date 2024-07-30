class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name,:position, :department, :profile])
    end

    def after_sign_in_path_for(resource)

        if @user.profile == 'admin'
            session[:is_admin] = true
        end

        root_path 
    end

    def after_sign_out_path_for(resource)
        session.clear
        root_path
     end

end
