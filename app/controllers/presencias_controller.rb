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
    @presencium = Presencia.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @presencium }
    end
  end

  # GET /presencia/new
  # GET /presencia/new.json
  def new
    @presencium = Presencia.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @presencium }
    end
  end

  # GET /presencia/1/edit
  def edit
    @presencium = Presencia.find(params[:id])
  end

  # POST /presencia
  # POST /presencia.json
  def create
    @presencium = Presencia.new(params[:presencium])

    respond_to do |format|
      if @presencium.save
        format.html { redirect_to @presencium, notice: 'Presencia was successfully created.' }
        format.json { render json: @presencium, status: :created, location: @presencium }
      else
        format.html { render action: "new" }
        format.json { render json: @presencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /presencia/1
  # PUT /presencia/1.json
  def update
    @presencium = Presencia.find(params[:id])

    respond_to do |format|
      if @presencium.update_attributes(params[:presencium])
        format.html { redirect_to @presencium, notice: 'Presencia was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @presencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presencia/1
  # DELETE /presencia/1.json
  def destroy
    @presencium = Presencia.find(params[:id])
    @presencium.destroy

    respond_to do |format|
      format.html { redirect_to presencia_url }
      format.json { head :ok }
    end
  end
end
