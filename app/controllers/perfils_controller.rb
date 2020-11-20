class PerfilsController < ApplicationController
  before_action :set_perfil, only: [:show, :update, :destroy]

  # GET /perfils
  def index
    @perfils = Perfil.all

    render json: @perfils
  end

  # GET /perfils/1
  def show
    render json: @perfil
  end

  # POST /perfils
  def create
    @perfil = Perfil.new(perfil_params)

    if @perfil.save
      render json: @perfil, status: :created, location: @perfil
    else
      render json: @perfil.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /perfils/1
  def update
    if @perfil.update(perfil_params)
      render json: @perfil
    else
      render json: @perfil.errors, status: :unprocessable_entity
    end
  end

  # DELETE /perfils/1
  def destroy
    @perfil.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_perfil
      @perfil = Perfil.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def perfil_params
      params.require(:perfil).permit(:descricao)
    end
end
