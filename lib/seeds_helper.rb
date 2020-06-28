module SeedsHelper
  def self.static_page!
    StaticPage.create! title: "About me", slug: "about-me", content: paragraph
  end

  def self.comment!(article, user)
    Comment.create! article: article,
                    user: user,
                    content: paragraph
  end

  def self.article!(company, user)
    Article.create! title: sentence, content: paragraph, status: :published, user: user, company: company
  end

  def self.user!(email=nil)
    email = "#{word(20)}@example.com" if email == nil
    User.create! full_name: "#{word.capitalize} #{word.capitalize}",
                 email: email,
                 password: "12345678",
                 confirmed_at: DateTime.current
  end

  def self.company!(user)
    Company.create! name: sentence, slug: sentence.parameterize, owner: user
  end

  def self.paragraph(size = 0)
    size = rand(6..12) if size.zero?
    (0..size).map { "#{sentence} " }.join
  end

  def self.sentence(size = 0)
    size = rand(2..10) if size.zero?
    (0..size).map { " #{word}" }.join
  end

  def self.word(size = 0)
    size = rand(2..8) if size.zero?
    (0..size).map { ("a".."z").to_a[rand(26)] }.join
  end
end
