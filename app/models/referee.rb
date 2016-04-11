class Referee < ActiveRecord::Base
	belongs_to :user
  belongs_to :person
  accepts_nested_attributes_for :user, :person

  validates :title, presence: true, length: {minimum:1, maximum:15}
  validates :forename, presence: true, length: {minimum:1, maximum:15}
  validates :surname, presence: true, length: {minimum:1, maximum:75}
  validates :email, presence: true, length: {minimum:1, maximum:50}
  validates :contactPhone, presence: true, length: {minimum:1, maximum:50}
  validates :relationship, presence: true, length: {minimum:1, maximum:75}
  validates :permissionToContact, presence: true, length: {minimum:1, maximum:50}

end
