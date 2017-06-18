require "rails_helper"

RSpec.describe ChatController, :type => :controller do
  it "responds with a redirect when not logged in" do
    get :chat
    expect(response).to have_http_status(302)
    post :post_text
    expect(response).to have_http_status(302)
  end
end
