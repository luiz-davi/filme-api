require 'rails_helper'

RSpec.describe 'Filmes API', type: :request do
    describe 'GET /povoar_banco' do

        it 'povoando banco com as informações do arquivo .csv' do
            get '/api/v1/povoar_banco'

            expect(response).to have_http_status(:created)
            expect(JSON.parse(response.body).size).to eq(126)
        end
    end

    describe 'GET /filtro_lancamento' do

        it 'povoando banco com as informações do arquivo .csv' do
            get '/api/v1/povoar_banco'

            expect(response).to have_http_status(:created)
            expect(JSON.parse(response.body).size).to eq(126)
        end
    end
end