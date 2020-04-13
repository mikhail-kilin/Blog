user = SeedsHelper::user!
company = SeedsHelper::company! user
SeedsHelper::static_page!
20.times do
  SeedsHelper::article! company, user
end
