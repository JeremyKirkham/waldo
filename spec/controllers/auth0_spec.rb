require "rails_helper"

RSpec.describe Auth0Controller, :type => :controller do
  describe 'it logs in' do
    before {
      request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:auth0]
      get :callback
    }
    it { should set_session[:userinfo] }
    it { should redirect_to(root_url) }
  end
  describe 'it logs out' do
    before { get :logout }
    it { should_not set_session }
    it { should respond_with(302) }
    it { should redirect_to(logout_url.to_s) }
  end
end
