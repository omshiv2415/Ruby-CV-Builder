class Skill < ActiveRecord::Base
	belongs_to :user
  belongs_to :skill
  accepts_nested_attributes_for :user, :skill

  validates :skillType, presence: true, length: {minimum:1, maximum:15}
  validates :skillName, presence: true, length: {minimum:1, maximum:15}
  validates :skillLevel, presence: true, length: {minimum:1, maximum:75}


end
