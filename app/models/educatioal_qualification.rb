class EducatioalQualification < ActiveRecord::Base
	belongs_to :user
  belongs_to :educatioal_qualification
  accepts_nested_attributes_for :user, :educatioal_qualification
  validates :qualificationType, presence: true, length: {minimum:1, maximum:15}
  validates :courseName, presence: true, length: {minimum:1, maximum:70}
  validates :EducationalLevels_idEducationLevel, presence: true, length: {minimum:1, maximum:15}
  validates :vocational, presence: true, length: {minimum:1, maximum:15}
  validates :nameOfInstitutions, presence: true, length: {minimum:1, maximum:75}
  validates :mainSubject, presence: true, length: {minimum:1, maximum:50}
  validates :country, presence: true, length: {minimum:1, maximum:50}
  validates :yearObtained, presence: true, length: {minimum:1, maximum:15}
  validates :result, presence: true, length: {minimum:1, maximum:15}
  validates :thesesTitle, presence: true, length: {minimum:1, maximum:50}
  validates :verified, presence: true, length: {minimum:1, maximum:15}
  validates :howVerified, presence: true, length: {minimum:1, maximum:15}

end
