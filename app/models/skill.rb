class Skill < ActiveRecord::Base
  belongs_to :user
  belongs_to :person
  accepts_nested_attributes_for :user, :person

  validates :skillType, presence: true, length: { minimum: 1, maximum: 15 }
  validates :skill_name, presence: true, length: { minimum: 1, maximum: 15 }
  #validates :skill_name, uniqueness: { case_sensitive: false }
  #validates_uniqueness_of :skill_name, scope: :user_id
  validates :skillLevel, presence: true, length: { minimum: 1, maximum: 75 }

  before_save :user_setup


  private

  def user_setup
    self.person_id = user_id
  end


end
