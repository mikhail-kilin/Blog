json.owner do
  json.partial! "author", author: company.owner
end
json.authors do
  json.array! company.authors, partial: "author", as: :author
end
