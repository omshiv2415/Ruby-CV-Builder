json.array!(@experiences) do |experience|
  json.extract! experience, :id, :idExperiences, :Persons_idUser, :dateStarted, :dateFinished, :JobTitles_idJobTitles, :other_jobtitle, :keyDuties, :EmploymentLevels_idLevelsOfEmployment, :employerName, :verified, :howVerified
  json.url experience_url(experience, format: :json)
end
