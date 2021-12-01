require 'csv'

class ApplicationController < ActionController::API
    before_action :povoandoBanco

    def povoandoBanco
        unless Filme.all.any?
            erro = []
            file = "C:/Users/luizd/Mobile2you/api-mobile2you/app/controllers/netflix_titles.csv"
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

                    novo_filme = Filme.new show_id: show_id, tipo: tipo, diretor: diretor, elenco: elenco, pais: pais, adicionado: adicionado, lancamento: lancamento, avaliacao: avaliacao, duracao: duracao, categoria: categoria, descricao: descricao
                    novo_filme.save
                rescue Exception => e
                    erro << e
                end
            end
        end
    end
end
