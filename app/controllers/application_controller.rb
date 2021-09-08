# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller? 
  
  after_action :verify_authorized, except: [:index, :show], unless: :skip_pundit?
  #after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  helper_method :current_order

  def after_sign_in_path_for(resource)
    root_path
  end

  def current_order
    if current_user.present?
      order = current_user.orders.where(status: "initialized").take
      order = current_user.orders.create(monto: 0) if order.nil?
      order
    else
      nil
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
