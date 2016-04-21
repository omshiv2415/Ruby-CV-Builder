json.array!(@skills) do |skill|
  json.extract! skill, :id, :idSkills, :skillType, :Person_idUser, :skill_name, :skillLevel, :verified, :howVerified
  json.url skill_url(skill, format: :json)
end
