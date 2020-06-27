json.extract! blog, :id, :judul, :created_at, :updated_at
json.url blog_url(blog, format: :json)
