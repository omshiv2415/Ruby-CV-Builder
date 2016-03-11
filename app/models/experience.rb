class Experience < ActiveRecord::Base
	belongs_to :user
  belongs_to :person
  accepts_nested_attributes_for :user
end
