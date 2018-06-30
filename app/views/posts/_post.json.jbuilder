json.extract! post, :id, :name, :link, :semester, :type, :professor_id, :course_id, :created_at, :updated_at
json.url post_url(post, format: :json)
