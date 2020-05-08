class Author
  include Comparable

  attr_reader :full_name, :count_of_articles, :count_of_comments

  def initialize(user, company)
    @full_name = user.full_name
    @count_of_articles = user.articles.where(company: company).count
    @count_of_comments = company.comments.where(user: user).count
  end

  def <=>(other)
    @count_of_comments <=> other.count_of_comments
  end

  def self.from_list(users, company)
    users.map { |user| Author.new(user, company) }
  end
end
