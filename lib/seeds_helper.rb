module SeedsHelper
  def self.static_page!
    StaticPage.create! title: "About me", slug: "about-me", content: paragraph
  end

  def self.article!
    Article.create! title: sentence, content: paragraph, status: :published
  end

  def self.user!
    User.create! full_name: "#{word.capitalize} #{word.capitalize}",
                 email: "1kilinmv1@gmail.com",
                 password: "12345678",
                 confirmed_at: DateTime.current
  end

  def self.paragraph(size = 0)
    size = rand(6..12) if size.zero?
    (0..size).map { "#{sentence} " }.join
  end

  def self.sentence(size = 0)
    size = rand(2..10) if size.zero?
    word.capitalize + (0..size).map { " #{word}" }.join + "."
  end

  def self.word(size = 0)
    size = rand(2..8) if size.zero?
    (0..size).map { ("a".."z").to_a[rand(26)] }.join
  end
end
