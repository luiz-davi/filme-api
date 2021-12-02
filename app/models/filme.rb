class Filme < ApplicationRecord

    validates :show_id, presence: true
    validates :tipo, presence: true
    validates :titulo, presence: true
    validates :diretor, presence: true
    validates :elenco, presence: true
    validates :duracao, presence: true
    validates :categoria, presence: true
end
