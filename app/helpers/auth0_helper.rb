module Auth0Helper
  def logged_in?
    session[:userinfo].present?
  end

  def logout_url
    creds = { client_id: ENV['AUTH0_CLIENT_ID'],
    client_secret: ENV['AUTH0_CLIENT_SECRET'],
    api_version: 1,
    domain: ENV['AUTH0_DOMAIN'] }
    auth0_client = Auth0Client.new(creds)
    auth0_client.logout_url(root_url)
  end
end
