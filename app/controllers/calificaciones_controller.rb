class CalificacionesController < ApplicationController
  before_filter :obtener_alumno
  # GET /calificacions
  # GET /calificacions.json
  def index
    @calificaciones = @alumno.calificaciones
  end

  # GET /calificacions/1
  # GET /calificacions/1.json
  def show
    @calificacion = @alumno.calificaciones.find(params[:id])
  end

  # GET /calificacions/new
  # GET /calificacions/new.json
  def new
    @calificacion = @alumno.calificaciones.build
    if current_user.alumno?
      @asignaturas = @alumno.asignaturas_restantes
    else
      if profesor
        @asignaturas = profesor.asignaturas
      elsif current_user.administrador?
        @asignaturas = Asignatura.all
      end
    end
  end

  # GET /calificacions/1/edit
  def edit
    @calificacion = @alumno.calificaciones.find(params[:id])
    if current_user.alumno?
      @asignaturas=@alumno.asignaturas_restantes
    else
      @asignaturas = profesor.asignaturas if profesor
    end
  end

  # POST /calificacions
  # POST /calificacions.json
  def create
    @calificacion = @alumno.calificaciones.build(params[:calificacion])

    respond_to do |format|
      if @calificacion.save
       format.html {redirect_to @alumno, notice: 'Calificacion was successfully created.'}
      else
        @asignaturas = Asignatura.all
        format.html {render action: "new"}
      end
        end
  end

  # PUT /calificacions/1
  # PUT /calificacions/1.json
  def update
    @calificacion = @alumno.calificaciones.find(params[:id])


    respond_to do |format|
      if @calificacion.update_attributes(params[:calificacion])
        format.html { redirect_to @alumno, notice: 'Calificacion was successfully updated.' }
        format.json { head :ok }
      else
        @asignaturas = Asignatura.all
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

    redirect_to alumno_url(@alumno)

  end

  private
  def obtener_alumno
    @alumno = Alumno.find(params[:alumno_id])
  end

  def profesor
    current_user.logable if current_user.profesor?
  end
end
