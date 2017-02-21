require 'rails_helper'

RSpec.describe Profile, type: :model do
	it { should belong_to(:user) }
	it { should have_many(:bookexchanges) }
	it { should have_many(:books) }
end