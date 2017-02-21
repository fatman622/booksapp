require 'rails_helper'

RSpec.describe Bookexchange, type: :model do
  it { should belong_to(:profile) }
  it { should belong_to(:book) }
end
