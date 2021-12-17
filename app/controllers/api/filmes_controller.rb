require 'csv'
class Api::FilmesController < ApplicationController
  before_action :set_filme, only: [:show, :update, :destroy]


  # GET /filmes
  def index
    @filmes = Filme.all

    render json: @filmes
  end

  def povoar_banco
    unless Filme.all.any?
      erro = []
      file = 'C:\Users\Augusto\Desktop\Davi\api-filmes\tmp\netflix_titles.csv'
      CSV.foreach(file, col_sep: ",") do |linha|
        begin

            next if linha[0] == "show_id"

            show_id = linha[0]
            tipo = linha[1]
            titulo = linha[2]
            diretor = linha[3]
            elenco = linha[4]
            pais = linha[5]
            adicionado = linha[6]
            lancamento = linha[7]
            avaliacao = linha[8]
            duracao = linha[9]
            categoria = linha[10]
            descricao = linha[11]

            novo_filme = Filme.create show_id: show_id, tipo: tipo, titulo: titulo, diretor: diretor, elenco: elenco, pais: pais, adicionado: adicionado, lancamento: lancamento, avaliacao: avaliacao, duracao: duracao, categoria: categoria, descricao: descricao
        rescue Exception => e
            erro << e
        end
      end

      @filmes = Filme.all

      render json: @filmes

  end

  end

  def filtrarAno
    @filmes = Filme.select { |filme| filme.lancamento <= 2000 }

    render json: @filmes
  end

  def filtrarCategoria
    @filmes = Filme.where(tipo: "TV Show")

    render json: @filmes
  end

  def filtrarPais
    @filmes = Filme.where(pais: "Italy")

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
