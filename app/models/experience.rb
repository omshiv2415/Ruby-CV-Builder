class Experience < ActiveRecord::Base
	belongs_to :user
  belongs_to :person
  accepts_nested_attributes_for :user
  validates :dateStarted, presence: true, length: {minimum:1, maximum:15}
  validates :dateFinished, presence: true, length: {minimum:1, maximum:15}
  validates :JobTitles_idJobTitles, presence: true, length: {minimum:1, maximum:15}
  validates :otherJobTitle, presence: true, length: {minimum:1, maximum:15}
  validates :keyDuties, presence: true, length: {minimum:1, maximum:75}
  validates :employerName, presence: true, length: {minimum:1, maximum:50}
  validates :verified, presence: true, length: {minimum:1, maximum:15}
  validates :howVerified, presence: true, length: {minimum:1, maximum:15}

end
