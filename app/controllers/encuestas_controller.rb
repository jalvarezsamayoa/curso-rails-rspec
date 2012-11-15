class EncuestasController < InheritedResources::Base
  before_filter :authenticate_usuario!
   before_filter :verificar_role_administrador!
     actions :all, :except => [ :show ]

  # GET /encuestas
  # GET /encuestas.json
  def index
    unless current_usuario.has_role? :administrador
      render "dashboard/show"
    else
      @encuestas = Encuesta.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @encuestas }
      end
    end
  end


end
