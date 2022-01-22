require 'csv'
module Api
  module V1
    class FilmesController < ApplicationController
      rescue_from ActionController::ParameterMissing, with: :parameter_missing  
      # GET /filmes
      def index
        @filmes = Filme.all
    
        render json: @filmes
      end
    
      def povoar_banco
        SettleDbService.settle_db

        render json: Filme.all, status: :created
      end
    
    
      def filtro_lancamento
        @filmes = Filme.select { |filme| filme.year == params.require(:year).to_i }
    
        render json: @filmes, status: :ok
      end
    
      def filtro_categoria
        @filmes = Filme.where(genre: params.require(:genrer))
    
        render json: @filmes, status: :ok
      end
    
      def filtro_country
        @filmes = Filme.where(country: params.require(:country))
    
        render json: @filmes,status: :ok
      end
    
      def filtro_title
        @filmes = Filme.find_by(title: params.require(:title))
    
        render json: @filmes, status: :ok
      end

      private

      def parameter_missing(e)
        render json: { error: e.message }, status: :unprocessable_entity
      end
    end
  end
end

