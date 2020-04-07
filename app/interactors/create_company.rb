class CreateCompany
  include Interactor

  def call
    return if context.params[:name].blank?
    company = Company.create context.params
    result = CompanyErrors.call company: company
    context.fail! unless result.success?
    CompanyRole.create company: company, user: @user
  end
end
