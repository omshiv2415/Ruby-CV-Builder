class Experience < ActiveRecord::Base
	belongs_to :user
  belongs_to :person
  accepts_nested_attributes_for :user, :person
  validates :dateStarted, presence: true, length: {minimum:1, maximum:15}
  validates :dateFinished, presence: true, length: {minimum:1, maximum:15}
  validates :otherJobTitle, presence: true, length: {minimum:1, maximum:150}
  validates :keyDuties, presence: true, length: {minimum:1, maximum:75}
  validates :employerName, presence: true, length: {minimum:1, maximum:50}
  before_save :user_setup
	private
	def user_setup
			self.person_id = self.user_id
	end
end
