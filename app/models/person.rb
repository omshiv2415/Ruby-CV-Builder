class Person < ActiveRecord::Base
  belongs_to :user
  has_many :educatioal_qualification
  has_many :skill
  has_many :experience
  accepts_nested_attributes_for :user, :educatioal_qualification, :skill, :experience

  has_attached_file :photo,styles: { thumb: ["64x64#", :jpg],
                            original: ['300x300>', :jpg] },
                            convert_options: { thumb: "-quality 75 -strip",
                            original: "-quality 85 -strip" }
  #validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
	validates_attachment :photo, presence: true,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
                     size: { in: 0..5000.kilobytes }
  has_attached_file :mycv
  validates_attachment_content_type :mycv, :content_type => [ 'application/pdf','text/plain']
  before_save :user_setup


	private
	def user_setup
		if self.id.blank?
			self.id = self.user_id
			#self.user_id = self.email
		end
	end

  def self.search(query)
  if query
    where(['forename1 LIKE ? OR surname LIKE ?', "%#{query}%", "%#{query}%"])
  else
    self.all
  end
end
end