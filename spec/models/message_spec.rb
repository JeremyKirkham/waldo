require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'Field Validations' do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:direction) }
  end
end
