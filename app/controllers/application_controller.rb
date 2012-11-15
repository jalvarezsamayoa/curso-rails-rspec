class ApplicationController < ActionController::Base
  protect_from_forgery

  def verificar_role_administrador!
    unless current_usuario.has_role? :administrador
      redirect_to root_path, :notice => 'Usted no tiene acceso a esta opcion.'
    end
  end
end
