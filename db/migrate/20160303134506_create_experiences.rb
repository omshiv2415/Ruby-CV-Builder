class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.integer :idExperiences
      t.integer :Persons_idUser
      t.date :dateStarted
      t.date :dateFinished
      t.integer :JobTitles_idJobTitles, limit: 6
      t.string :otherJobTitle, limit: 45
      t.string :keyDuties, limit: 255
      t.integer :EmploymentLevels_idLevelsOfEmployment, limit: 4
      t.string :employerName, limit: 45
      t.integer :verified, limit: 1
      t.string :howVerified, limit: 45
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
