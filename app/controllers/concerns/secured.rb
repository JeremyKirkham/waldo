module Secured
  extend ActiveSupport::Concern

  included do
    before_action :logged_in_using_omniauth?
    before_action :create_or_load_user
  end

  def logged_in_using_omniauth?
    redirect_to '/login' unless session[:userinfo].present?
  end

  def logged_in?
    session[:userinfo].present?
  end

  def current_user
    userinfo = session[:userinfo]
    auth0_id = userinfo[:extra][:raw_info][:clientID]
    @user = User.find_by_auth0(auth0_id)
  end

  def create_or_load_user
    return unless session[:userinfo][:info].present?

    userinfo = session[:userinfo]
    email = userinfo[:info][:email]
    auth0_id = userinfo[:extra][:raw_info][:clientID]
    if auth0_user_exists?(auth0_id)
      @user = User.find_by_auth0(auth0_id)
    else
      @user = User.new(email: email, auth0: auth0_id)
      @user.save
    end
  end

  def auth0_user_exists?(auth0_id)
    user = User.find_by_auth0(auth0_id)
    !user.nil?
  end
end
