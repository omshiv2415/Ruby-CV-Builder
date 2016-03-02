class Person < ActiveRecord::Base
  belongs_to :user
  accepts_nested_attributes_for :user
  has_attached_file :photo
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  #validate :user_quota, :on => :create

private
  def user_quota
   debit = Person.find(user_id)
   if debit > 1
     errors.add(:base, "Please Edit Your Personal information")
  end
end
end