class EducatioalQualification < ActiveRecord::Base
	belongs_to :user
  belongs_to :educatioal_qualification
  accepts_nested_attributes_for :user, :educatioal_qualification
end
