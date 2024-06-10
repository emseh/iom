# frozen_string_literal: true

class AuthenticationController < ApplicationController
  before_action :authenticate_user!
  layout 'adminlte'

  # include UserAuthentication
  # include Pundit::Authorization

  # before_action :authorize_user!

  # before_action :set_default_email

  # rescue_from Pundit::NotAuthorizedError, with: :unauthorize_access

  # protected

  # # Find if user token is exist on redis storage and not yet revoked
  # # TODO:
  # # 1. Check token expire
  # # 2. Check user's browser ID to prevent cookie stealing
  # # 3. Check user's role access

  # def authorize_user!
  #   authorized? { valid_bearer_token? }
  # end

  # def set_default_email
  #   return if user_profile.blank?

  #   set_user_email if valid_bearer_token? && user_profile&.email.blank?
  # end

  # private

  # def profile_id
  #   @profile_id ||= ProfileInformation.find_by!(user_id: current_session[:resource_owner_id])&.id
  # end

  # def user_profile
  #   @user_profile ||= ProfileInformation.find_by(user_id: current_session[:resource_owner_id])
  # end

  # def set_user_email
  #   user_profile.update_columns(email: current_session[:email]) if current_session.present? && user_profile.present?
  # end

  # def pundit_user
  #   current_session
  # end

  # def current_session
  #   get_current_session(bearer_token)&.symbolize_keys || {}
  # end

  # def authorized?
  #   authorized = yield
  #   authorized ? return : unauthorize_access
  # end

  # def unauthorize_access
  #   render json: { message: 'You don\'t have access to perform the action.' }, status: :unauthorized
  # end

  # def valid_bearer_token?
  #   bearer_token_is_valid?(bearer_token)
  # end

  # def user_has_role?(role)
  #   get_user_roles(bearer_token) == role
  # end

  # def bearer_token
  #   return '' if request.headers['Authorization'].blank?

  #   request.headers['Authorization'].split.last
  # end
end
