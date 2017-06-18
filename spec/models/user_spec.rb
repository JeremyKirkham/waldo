require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Field Validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:auth0) }
  end
end
