class CreateFilmes < ActiveRecord::Migration[6.1]
  def change
    create_table :filmes do |t|
      t.string :title
      t.string :genre
      t.integer :year
      t.string :country
      t.string :published_at
      t.text :description

      t.timestamps
    end
  end
end
