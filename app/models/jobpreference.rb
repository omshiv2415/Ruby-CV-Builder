class Jobpreference < ActiveRecord::Base
  belongs_to :user
  belongs_to :person
  accepts_nested_attributes_for :user, :person
  validates :job_title, presence: true, length: { minimum: 1, maximum: 70 }
  #validates :job_title, uniqueness: { case_sensitive: false }
  #validates_uniqueness_of :job_title, scope: :user_id
  before_save :user_setup



  private

  def user_setup
    self.person_id = user_id
  end
end
