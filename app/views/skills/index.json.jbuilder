json.array!(@skills) do |skill|
  json.extract! skill, :id, :idSkills, :Person_idUser, :skillName, :skillLevel, :verified, :howVerified
  json.url skill_url(skill, format: :json)
end