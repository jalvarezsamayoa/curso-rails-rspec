class RutasController < InheritedResources::Base
  before_filter :authenticate_usuario!
   actions :all, :except => [ :show ]

  def create
    create!(:notice => 'Cambios grabados con exito.')
  end

  def update
    update!(:notice => 'Cambios grabados con exito.')
  end

  def destroy
    destroy!(:notice => 'Ruta eliminada con exito.')
  end
end