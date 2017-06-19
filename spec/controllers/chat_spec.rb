require "rails_helper"

RSpec.describe ChatController, :type => :controller do
  describe 'it should redirct when not logged in' do
    context 'getting chat' do
      before { get :chat }
      it { should respond_with(302) }
    end
    context 'deleting history' do
      before { post :delete_history }
      it { should respond_with(302) }
    end
  end
end
