class ReportQuery
  def initialize(company, comments_flag = "all", articles_flag = "all")
    @company = company
    @comments_flag = comments_flag
    @articles_flag = articles_flag
  end

  def send
    @company.authors
    .send(@comments_flag)
    .send(@articles_flag)
    .order(:comments_count)
  end
end
