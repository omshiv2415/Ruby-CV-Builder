class Jobpreference < ActiveRecord::Base
  belongs_to :user
  belongs_to :person
  accepts_nested_attributes_for :user, :person
  before_save :user_setup
	private
	def user_setup
			self.person_id = self.user_id
	end

end
