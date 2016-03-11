class Skill < ActiveRecord::Base
	belongs_to :user
  belongs_to :skill
  accepts_nested_attributes_for :user, :skill
end
