json.extract! user, :id, :user_emp_id, :first_name, :last_name, :email, :role, :created_at, :updated_at
json.url user_url(user, format: :json)
