require 'csv'

class SettleDbService

    def self.settle_db
        unless Filme.all.any?
            erro = []
            file = '/home/luiz/filmes_data/netflix_titles.csv'
            CSV.foreach(file, col_sep: ",") do |linha|
                begin
        
                    next if linha[0] == "show_id"
        
                    genre = linha[1]
                    title = linha[2]
                    country = linha[5]
                    published_at = Date.parse(linha[6])
                    year = linha[7]
                    description = linha[11]
        
                    novo_filme = Filme.create  title: title, genre: genre, year: year, country: country, published_at: published_at, description: description
                rescue Exception => e
                    erro << e
                end
            end
        end
    end

end