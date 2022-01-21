class Filme < ApplicationRecord

    validates :title, presence: true, uniqueness: true
    validates :genre, presence: true
    validates :year, presence: true
    validates :country, presence: true
    validates :published_at, presence: true
    validates :description, presence: true
    
end
