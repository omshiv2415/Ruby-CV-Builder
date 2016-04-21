class EducatioalQualification < ActiveRecord::Base
  belongs_to :user
  belongs_to :educatioal_qualification
  accepts_nested_attributes_for :user, :educatioal_qualification
  validates :qualification_type, presence: true, length: { minimum: 1, maximum: 15 }
  validates :courseName, presence: true, length: { minimum: 1, maximum: 70 }
  validates :courseName, uniqueness: { case_sensitive: false }
  validates_uniqueness_of :courseName, scope: :user_id
  validates :EducationalLevels_idEducationLevel, presence: true, length: { minimum: 1, maximum: 15 }
  validates :nameOfInstitutions, presence: true, length: { minimum: 1, maximum: 75 }
  validates :mainSubject, presence: true, length: { minimum: 1, maximum: 50 }
  validates :country, presence: true, length: { minimum: 1, maximum: 50 }
  validates :yearObtained, presence: true, length: { minimum: 1, maximum: 15 }
  validates :result, presence: true, length: { minimum: 1, maximum: 25 }
  validates :thesesTitle, presence: true, length: { minimum: 1, maximum: 50 }
  before_save :user_setup

  private

  def user_setup
    self.person_id = user_id
  end
end
