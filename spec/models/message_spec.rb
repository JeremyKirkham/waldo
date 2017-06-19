require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'field validations' do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:direction) }
    it { is_expected.to callback(:broadcast).after(:save) }
    it { is_expected.to callback(:lexify).after(:save) }
  end
end
