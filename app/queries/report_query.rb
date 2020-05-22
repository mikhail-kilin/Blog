class ReportQuery
  def initialize(company, comments_flag, articles_flag)
    @company_id = company.id
    @comments_flag = comments_flag
    @articles_flag = articles_flag
  end

  def send
    User.find_by_sql [%(
      WITH t1 AS (
        SELECT COUNT(comments.*) as com_count, comments.user_id AS user_id
        FROM comments
        INNER JOIN articles ON comments.article_id = articles.id
        WHERE articles.company_id = ?
        GROUP BY comments.user_id
      ), t2 AS (
        SELECT COUNT(articles.*) as art_count, articles.user_id AS user_id
        FROM articles
        WHERE articles.company_id = ?
        GROUP BY articles.user_id
      )
      SELECT users.full_name, CASE WHEN art_count IS NULL THEN 0 ELSE art_count END,
        CASE WHEN com_count IS NULL THEN 0 ELSE com_count END
      FROM users
      LEFT JOIN t1 ON users.id = t1.user_id
      LEFT JOIN t2 ON users.id = t2.user_id
      INNER JOIN companies_users ON users.id = companies_users.author_id
      WHERE companies_users.company_id = ? AND CASE
      WHEN ? = 'present' THEN com_count IS NOT NULL
      WHEN ? = 'empty' THEN com_count IS NULL
      ELSE TRUE END
      AND CASE
      WHEN ? = 'present' THEN art_count IS NOT NULL
      WHEN ? = 'empty' THEN art_count IS NULL
      ELSE TRUE END
      ORDER BY com_count;
    ), @company_id, @company_id, @company_id, @comments_flag, @comments_flag, @articles_flag, @articles_flag]
  end
end
