json.array!(@educatioal_qualifications) do |educatioal_qualification|
  json.extract! educatioal_qualification, :id, :idEducationalQualification, :Persons_idUser, :qualification_type, :courseName, :EducationalLevels_idEducationLevel, :vocational, :mainSubject, :nameOfInstitutions, :country, :yearObtained, :result, :thesesTitle, :verified, :howVerified
  json.url educatioal_qualification_url(educatioal_qualification, format: :json)
end
