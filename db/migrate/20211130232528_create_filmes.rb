class CreateFilmes < ActiveRecord::Migration[6.1]
  def change
    create_table :filmes do |t|
      t.string :show_id
      t.string :tipo
      t.string :titulo
      t.string :diretor
      t.text :elenco
      t.string :pais
      t.string :adicionado
      t.integer :lancamento
      t.string :avaliacao
      t.string :duracao
      t.string :categoria
      t.text :descricao

      t.timestamps
    end
  end
end
