class EncuestasController < ApplicationController
  before_filter :authenticate_usuario!

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

  # GET /encuestas/1
  # GET /encuestas/1.json
  def show
    @encuesta = Encuesta.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @encuesta }
    end
  end

  # GET /encuestas/new
  # GET /encuestas/new.json
  def new
    @encuesta = Encuesta.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @encuesta }
    end
  end

  # GET /encuestas/1/edit
  def edit
    @encuesta = Encuesta.find(params[:id])
  end

  # POST /encuestas
  # POST /encuestas.json
  def create

    @encuesta = Encuesta.new(params[:encuesta])

    respond_to do |format|
      if @encuesta.save
        format.html { redirect_to @encuesta, notice: 'Cambios grabados con exito.' }
        format.json { render json: @encuesta, status: :created, location: @encuesta }
      else
        format.html { render action: "new" }
        format.json { render json: @encuesta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /encuestas/1
  # PUT /encuestas/1.json
  def update
    @encuesta = Encuesta.find(params[:id])

    respond_to do |format|
      if @encuesta.update_attributes(params[:encuesta])
        format.html { redirect_to @encuesta, notice: 'Encuesta was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @encuesta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /encuestas/1
  # DELETE /encuestas/1.json
  def destroy
    @encuesta = Encuesta.find(params[:id])
    @encuesta.destroy

    respond_to do |format|
      format.html { redirect_to encuestas_url }
      format.json { head :no_content }
    end
  end
end
