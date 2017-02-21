class Profile < ApplicationRecord
	belongs_to :user
	
	has_many :bookexchanges
	has_many :books, :through => :bookexchanges

	has_attached_file :image, styles:{ medium: "300x300>", thumb: "100x100>"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
