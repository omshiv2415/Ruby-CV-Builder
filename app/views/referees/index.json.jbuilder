json.array!(@referees) do |referee|
  json.extract! referee, :id, :idReferees, :Persons_idUser, :title, :forename, :surname, :email, :contactPhone, :relationship, :permissionToContact, :verified, :howVerified, :referenceDoc
  json.url referee_url(referee, format: :json)
end
