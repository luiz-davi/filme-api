require 'csv'
module Api
  module V1
    class FilmesController < ApplicationController
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
    
    end
  end
end

