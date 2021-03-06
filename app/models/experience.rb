class Experience < ActiveRecord::Base
  belongs_to :user
  belongs_to :person
  accepts_nested_attributes_for :user, :person
  validates :dateStarted, presence: true, length: { minimum: 1, maximum: 15 }
  validates :dateFinished, presence: true, length: { minimum: 1, maximum: 15 }
  validates :other_jobtitle, presence: true, length: { minimum: 1, maximum: 150 }
  #validates :otherJobTitle, uniqueness: { case_sensitive: false }
  #validates_uniqueness_of :otherJobTitle, scope: :user_id
  validates :keyDuties, presence: true, length: { minimum: 1, maximum: 75 }
  validates :employerName, presence: true, length: { minimum: 1, maximum: 50 }
  before_save :user_setup

  private

  def user_setup
    self.person_id = user_id
  end
end
