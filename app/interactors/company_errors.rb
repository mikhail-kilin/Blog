class CompanyErrors
  include Interactor

  def call
    context.fail! if context.company.errors.count.positive?
  end
end
