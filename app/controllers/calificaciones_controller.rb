class CalificacionesController < ApplicationController
  before_filter :obtener_alumno
  # GET /calificacions
  # GET /calificacions.json
  def index
    @calificaciones = @alumno.calificaciones

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @calificacions }
    end
  end

  # GET /calificacions/1
  # GET /calificacions/1.json
  def show
    @calificacion = @alumno.calificaciones.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @calificacion }
    end
  end

  # GET /calificacions/new
  # GET /calificacions/new.json
  def new
    @calificacion = @alumno.calificaciones.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @calificacion }
    end
  end

  # GET /calificacions/1/edit
  def edit
    @calificacion = @alumno.calificaciones.find(params[:id])
  end

  # POST /calificacions
  # POST /calificacions.json
  def create
    @calificacion = @alumno.calificaciones.build(params[:calificacion])

    respond_to do |format|
      if @calificacion.save
        format.html { redirect_to @calificacion, notice: 'Calificacion was successfully created.' }
        format.json { render json: @calificacion, status: :created, location: @calificacion }
      else
        format.html { render action: "new" }
        format.json { render json: @calificacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /calificacions/1
  # PUT /calificacions/1.json
  def update
    @calificacion = @alumno.calificaciones.find(params[:id])


    respond_to do |format|
      if @calificacion.update_attributes(params[:calificacion])
        format.html { redirect_to @calificacion, notice: 'Calificacion was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @calificacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calificacions/1
  # DELETE /calificacions/1.json
  def destroy
    @calificacion = Calificacion.find(params[:id])
    @calificacion.destroy

    respond_to do |format|
      format.html { redirect_to calificacions_url }
      format.json { head :ok }
    end
  end

  private
  def obtener_alumno
    @alumno = Alumno.find(params[:alumno_id])
  end
end
