class User
  class ParameterSanitizer < Devise::ParameterSanitizer
    USER_PARAMS = %i[
      full_name
      email
      password
      password_confirmation
      avatar
    ].push own_company_attributes: %i[name slug]

    def initialize(*)
      super
      permit(:sign_up, keys: USER_PARAMS)
      permit(:account_update, keys: USER_PARAMS)
    end
  end
end
