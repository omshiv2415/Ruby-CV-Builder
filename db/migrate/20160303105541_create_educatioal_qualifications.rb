class CreateEducatioalQualifications < ActiveRecord::Migration
  def change
    create_table :educatioal_qualifications do |t|
      t.integer :idEducationalQualification
      t.integer :Persons_idUser
      t.string :qualificationType, limit: 16
      t.string :courseName, limit: 100
      t.integer :EducationalLevels_idEducationLevel, limit:3
      t.string :vocational, limit: 1
      t.string :mainSubject, limit: 45
      t.string :nameOfInstitutions, limit: 100
      t.string :country, limit: 45
      t.date :yearObtained
      t.string :result, limit: 20
      t.string :thesesTitle, limit: 200
      t.integer :verified, limit: 1
      t.string :howVerified, limit: 45

      t.timestamps null: false
    end
  end
end
