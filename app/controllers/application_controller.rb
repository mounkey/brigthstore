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
      # recuperar la orden reciente
      # necesitamos el ID or NIL porque session.current_order_id puede no existir
      # osea, necesitamos SI o SI un resultado
      recover_order_id = session[:current_order_id] || nil
      # ahora podemos recuperar la orden desde base de datos
      # buscar orden o crear en base de recover_order_id
      order = if recover_order_id.present? && !recover_order_id.empty?
                Order.find(recover_order_id)
              else
                order = Order.create(monto: 0)
              end

      # ahora hay que asignar la orden al usuario logeado
      if order.user.nil?
        order.user = current_user
        order.save!
      end
    else
      # si usuario no esta logeado, crear una orden temporal
      order = Order.create(monto: 0)
      session[:current_order_id] = order.id
    end

    # Devolver resultado explicito, definido
    return order
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
