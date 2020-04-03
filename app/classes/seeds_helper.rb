class SeedsHelper
  def self.static_page!
    StaticPage.create! title: "About me", slug: "about-me", content: paragraph
  end

  def self.article!
    Article.create! title: sentence, content: paragraph, status: :published
  end

  def self.user!
    User.create! full_name: "#{word.capitalize} #{word.capitalize}", email: "1kilinmv1@gmail.com", password: "12345678", confirmed_at: DateTime.now
  end

  private

  def self.paragraph(size = 0)
    size = rand(10) + 2 if size.zero?
    (0..size).map { "#{sentence} " }.join
  end

  def self.sentence(size = 0)
    size = rand(8) + 1 if size.zero?
    word.capitalize + (0..size).map { " #{word}" }.join + "."
  end

  def self.word(size = 0)
    size = rand(6) + 2 if size.zero?
    (0..size).map { ('a'..'z').to_a[rand(26)] }.join
  end
end