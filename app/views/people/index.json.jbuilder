json.array!(@people) do |person|
  json.extract! person, :id, :title, :forename1, :forename2, :surname, :addressLine1, :addressLine2, :town, :postcode, :secondEmail, :personalUrl, :photo, :female, :postcodeStart, :authorityToWorkStatement, :contactPreference, :EducationalLevels_idEducatonLevel, :noOfGcses, :gecseEnglishGrade, :gcseMathsGrade, :fiveOrMoreGcses, :noOfAlevels, :ucasPoints, :studentStatus, :mobile, :landline, :dob, :penaltyPoints, :mycv
  json.url person_url(person, format: :json)
end
