class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource_or_scope)
    busca_url
  end

  def after_sign_out_path_for(resource_or_scope)
    home_url
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :nome
    devise_parameter_sanitizer.for(:sign_up) << :sobrenome
    devise_parameter_sanitizer.for(:sign_up) << :telefone
    devise_parameter_sanitizer.for(:sign_up) << :endereco
    devise_parameter_sanitizer.for(:sign_up) << :cidade
    devise_parameter_sanitizer.for(:sign_up) << :estado
    devise_parameter_sanitizer.for(:sign_up) << :cep

    devise_parameter_sanitizer.for(:account_update) << :nome
    devise_parameter_sanitizer.for(:account_update) << :sobrenome
    devise_parameter_sanitizer.for(:account_update) << :telefone
    devise_parameter_sanitizer.for(:account_update) << :endereco
    devise_parameter_sanitizer.for(:account_update) << :cidade
    devise_parameter_sanitizer.for(:account_update) << :estado
    devise_parameter_sanitizer.for(:account_update) << :cep

  end

end
