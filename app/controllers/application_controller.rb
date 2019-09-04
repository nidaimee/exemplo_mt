class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_tenant
  before_action :redirect_if_no_tenant

  protected

  def redirect_if_no_tenant
    if !current_tenant && !['www', 'localhost'].include?(request.subdomains[0])
      redirect_to "http://localhost.com.br:3000/cadastre-se"
    end
  end
  
  def current_tenant
    #Algumas telas como login, editar usuario etc.. possuem barras de navegação que precisam deste parametro.
      @current_tenant ||= User.find_by(subdomain: request.subdomains[0])
  end    

  def configure_permitted_parameters
    # Permitindo no devise esse campo.
    devise_parameter_sanitizer.permit(:sign_up, keys: [:subdomain])
  end

end
