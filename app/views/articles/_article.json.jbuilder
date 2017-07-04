json.extract! article, :id, :category_id, :title, :en_title, :description, :content, :view_count, :created_at, :updated_at
json.url article_url(article, format: :json)
