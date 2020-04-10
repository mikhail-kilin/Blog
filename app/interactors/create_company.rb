class CreateCompany
  include Interactor

  def call
    return if context.params[:name].blank?
    company = Company.new context.params
    context.fail! unless company.save
    CompanyUser.create company: company, user: @user
  end
end
