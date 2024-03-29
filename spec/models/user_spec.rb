require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'field validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:auth0) }
    it { should have_many(:messages) }
  end
end
