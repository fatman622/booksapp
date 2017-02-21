require 'rails_helper'

RSpec.describe Book, type: :model do
	it { should validate_presence_of(:name) }
	it { should belong_to(:user) }
	it { should have_many(:bookexchanges) }
	it { should have_many(:profiles) }
end