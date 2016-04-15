class Jobpreference < ActiveRecord::Base
  belongs_to :user
  belongs_to :person
  accepts_nested_attributes_for :user, :person
  validates :job_title, presence: true, uniqueness: true, length: { minimum: 1, maximum: 70 }
  before_save :user_setup



  private

  def user_setup
    self.person_id = user_id
  end
end
