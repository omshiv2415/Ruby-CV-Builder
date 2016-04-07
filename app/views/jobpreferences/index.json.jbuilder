json.array!(@jobpreferences) do |jobpreference|
  json.extract! jobpreference, :id, :jobtitle, :job_title, :job_role, :role_type, :location, :happy_to_relocate, :user_id
  json.url jobpreference_url(jobpreference, format: :json)
end
