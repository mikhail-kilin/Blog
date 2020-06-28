user = SeedsHelper::user! "1kilinmv1@gmail.com"
company = SeedsHelper::company! user
article = SeedsHelper::article! company, user

20.times do
  current_user = SeedsHelper::user!
  current_user.companies.push company
  rand(0..5).times do
    SeedsHelper::article! company, current_user
  end
  rand(0..3).times do
    SeedsHelper::comment!(article, current_user)
  end
end
