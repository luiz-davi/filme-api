require 'csv'
class Api::FilmesController < ApplicationController
  before_action :set_filme, only: [:show, :update, :destroy]


  # GET /filmes
  def index
    @filmes = Filme.all

    render json: @filmes
  end

  def povoar_banco
    SettleDbService.settle_db

    @filmes = Filme.all

    render json: @filmes

  end


  def filtro_lancamento
    @filmes = Filme.select { |filme| filme.year <= params[:year].to_i }

    render json: @filmes
  end

  def filtro_categoria
    @filmes = Filme.where(genre: params[:genrer])

    render json: @filmes
  end

  def filtro_country
    @filmes = Filme.where(country: params[:country])

    render json: @filmes
  end

  def filtro_lancamento_genero
    @filmes = Filme.find_by(year: params[:year], genre: params[:genrer])

    render json: @filmes
  end

  # GET /filmes/1
  def show
    render json: @filme
  end

  # POST /filmes
  def create
    @filme = Filme.new(filme_params)

    if @filme.save
      render json: @filme, status: :created, location: @filme
    else
      render json: @filme.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /filmes/1
  def update
    if @filme.update(filme_params)
      render json: @filme
    else
      render json: @filme.errors, status: :unprocessable_entity
    end
  end

  # DELETE /filmes/1
  def destroy
    @filme.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_filme
      @filme = Filme.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def filme_params
      params.require(:filme).permit(:show_id, :tipo, :titulo, :diretor, :elenco, :pais, :adicionado, :lancamento, :avaliacao, :duracao, :categoria, :descricao)
    end
end
