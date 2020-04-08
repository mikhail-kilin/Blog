module Users
  class RegistrationsController < Devise::RegistrationsController
    def create
      super
      result = CreateCompany.call params: company_params
      flash[:error] = "Company not created, invalid name or slug" unless result.success?
    end

    protected

    def update_resource(resource, params)
      resource.update_attributes(params)
    end

    def account_update_params
      params = devise_parameter_sanitizer.sanitize(:account_update)

      params.except(:avatar) if avatar_blank?(params)

      if passwords_blank?(params)
        params.except(:password, :password_confirmation)
      else
        params
      end
    end

    def passwords_blank?(params)
      params[:password].blank? && params[:password_confirmation].blank?
    end

    def avatar_blank?(params)
      params[:avatar].blank?
    end

    def company_params
      params.require(:user).require(:company).permit(:name, :slug)
    end
  end
end
