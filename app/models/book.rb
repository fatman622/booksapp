class Book < ApplicationRecord
		validates :name, presence: true
	belongs_to :user

	has_many :bookexchanges
	has_many :profiles, :through => :bookexchanges
end
