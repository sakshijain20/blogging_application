json.extract! blog, :id, :title, :readtime, :category_id, :user_id, :image, :content, :created_at, :updated_at
json.url blog_url(blog, format: :json)
