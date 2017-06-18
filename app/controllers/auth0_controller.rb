class Auth0Controller < ApplicationController
  include Auth0Helper

  def callback
    # This stores all the user information that came from Auth0
    # and the IdP
    session[:userinfo] = request.env['omniauth.auth']
    cookies.signed[:auth0_id] =  session[:userinfo][:extra][:raw_info][:clientID]

    # Redirect to the URL you want after successful auth
    redirect_to '/'
  end

  def failure
    # show a failure page or redirect to an error page
    @error_msg = request.params['message']
  end

  def login
  end

  def logout
    reset_session
    cookies.delete(:auth0_id)
    redirect_to logout_url.to_s
  end
end
