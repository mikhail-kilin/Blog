user = SeedsHelper::user!
company = SeedsHelper::company! user
20.times do
  SeedsHelper::article! company, user
end
