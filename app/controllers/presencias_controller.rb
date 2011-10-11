class PresenciasController < ApplicationController
  # GET /presencia
  # GET /presencia.json
  def index
    @presencia = Presencia.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @presencia }
    end
  end

  # GET /presencia/1
  # GET /presencia/1.json
  def show
    @presencia = Presencia.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @presencia }
    end
  end

  # GET /presencia/new
  # GET /presencia/new.json
  def new
    @presencia = Presencia.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @presencia }
    end
  end

  # GET /presencia/1/edit
  def edit
    @presencia = Presencia.find(params[:id])
  end

  # POST /presencia
  # POST /presencia.json
  def create
    @presencia = Presencia.new(params[:presencia])

    respond_to do |format|
      if @presencia.save
        format.html { redirect_to @presencia, notice: 'Presencia was successfully created.' }
        format.json { render json: @presencia, status: :created, location: @presencia }
      else
        format.html { render action: "new" }
        format.json { render json: @presencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /presencia/1
  # PUT /presencia/1.json
  def update
    @presencia = Presencia.find(params[:id])

    respond_to do |format|
      if @presencia.update_attributes(params[:presencia])
        format.html { redirect_to @presencia, notice: 'Presencia was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @presencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presencia/1
  # DELETE /presencia/1.json
  def destroy
    @presencia = Presencia.find(params[:id])
    @presencia.destroy

    respond_to do |format|
      format.html { redirect_to presencia_url }
      format.json { head :ok }
    end
  end
end
