class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :title, limit: 10
      t.string :forename1, limit: 45
      t.string :forename2, limit: 45
      t.string :surname, limit: 45
      t.string :addressLine1, limit: 45
      t.string :addressLine2, limit: 45
      t.string :town, limit: 45
      t.string :postcode, limit: 10
      t.string :secondEmail, limit:50
      t.string :personalUrl, limit:64
      t.binary :photo
      t.string :female
      t.string :postcodeStart, limit: 10
      t.string :authorityToWorkStatement
      t.string :contactPreference
      t.integer :EducationalLevels_idEducatonLevel
      t.integer :noOfGcses
      t.string :gecseEnglishGrade, limit: 2
      t.string :gcseMathsGrade, limit: 2
      t.integer :fiveOrMoreGcses, limit: 2
      t.integer :noOfAlevels, limit: 4
      t.integer :ucasPoints, limit: 4
      t.string :studentStatus, limit: 15
      t.string :mobile, limit: 16
      t.string :landline, limit: 16
      t.date :dob
      t.integer :penaltyPoints, limit: 4
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
