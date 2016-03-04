class Person < ActiveRecord::Base
  belongs_to :user
  accepts_nested_attributes_for :user
  has_attached_file :photo,styles: { thumb: ["64x64#", :jpg],
                            original: ['300x300>', :jpg] },
                            convert_options: { thumb: "-quality 75 -strip",
                            original: "-quality 85 -strip" }
  #validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
	validates_attachment :photo, presence: true,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
                     size: { in: 0..5000.kilobytes }

end