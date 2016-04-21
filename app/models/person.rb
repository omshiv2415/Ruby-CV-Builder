class Person < ActiveRecord::Base
  belongs_to :user
  has_many :educatioal_qualification
  has_many :skill
  has_many :experience
  has_many :referee
  has_many :jobpreferences

  accepts_nested_attributes_for :user, :educatioal_qualification, :skill, :experience, :referee, :jobpreferences

  validates :title, presence: true, length: { minimum: 1, maximum: 15 }
  validates :forename1, presence: true, length: { minimum: 1, maximum: 70 }
  validates :forename2, presence: true, length: { minimum: 1, maximum: 15 }
  validates :surname, presence: true, length: { minimum: 1, maximum: 15 }
  validates :addressLine1, presence: true, length: { minimum: 1, maximum: 75 }
  validates :addressLine2, presence: true, length: { minimum: 1, maximum: 50 }
  validates :town, presence: true, length: { minimum: 1, maximum: 50 }
  validates :postcode, presence: true, length: { minimum: 1, maximum: 15 }
  validates :secondEmail, presence: true, length: { minimum: 1, maximum: 51 }
  validates :personalUrl, presence: true, length: { minimum: 1, maximum: 50 }
  validates :female, presence: true, length: { minimum: 1, maximum: 15 }
  validates :authorityToWorkStatement, presence: true, length: { minimum: 1, maximum: 1750 }
  validates :contactPreference, presence: true, length: { minimum: 1, maximum: 15 }
  validates :noOfGcses, presence: true, length: { minimum: 1, maximum: 15 }
  validates :gecseEnglishGrade, presence: true, length: { minimum: 1, maximum: 50 }
  validates :gcseMathsGrade, presence: true, length: { minimum: 1, maximum: 15 }
  validates :fiveOrMoreGcses, presence: true, length: { minimum: 1, maximum: 15 }
  validates :noOfAlevels, presence: true, length: { minimum: 1, maximum: 15 }
  validates :ucasPoints, presence: true, length: { minimum: 1, maximum: 50 }
  validates :mobile, presence: true, length: { minimum: 1, maximum: 15 }
  validates :landline, presence: true, length: { minimum: 1, maximum: 15 }
  validates :dob, presence: true, length: { minimum: 1, maximum: 50 }
  validates :penaltyPoints, presence: true, length: { minimum: 1, maximum: 15 }
  has_attached_file :photo, styles: { thumb: ['64x64#', :jpg],
                                      original: ['300x300>', :jpg] },
                            convert_options: { thumb: '-quality 75 -strip',
                                               original: '-quality 85 -strip' }
  # validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  validates_attachment :photo,
                       content_type: { content_type: ['image/jpeg', 'image/gif', 'image/png'] },
                       size: { in: 0..5000.kilobytes }
  has_attached_file :mycv
  validates_attachment_content_type :mycv, content_type: ['application/pdf', 'text/plain']
  before_save :user_setup

  private

  def user_setup
    self.id = user_id if id.blank?
  end

  def self.search(search_skill)
    if search_skill
      joins(:skill).where('skills.skillName ilike ?', "%#{search_skill}%")
    else
      find(:all)
    end
   end
end
