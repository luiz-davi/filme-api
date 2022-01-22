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
        before do
            get '/api/v1/povoar_banco'
        end

        it 'buscando filme pelo ano de lançamento' do
            get '/api/v1/filtro_lancamento', params: { year: 2000 }

            expect(response).to have_http_status(:ok)
            expect(JSON.parse(response.body)).to eq([
                {
                    "country"=>"United States",
                    "description"=>
                    "After her drunken antics result in property damage, an alcoholic journalist enters rehab – and soon meets a fellow resident who changes her outlook.",
                    "genre"=>"Movie",
                    "id"=>30,
                    "published_at"=>"2020-09-30",
                    "title"=>"28 Days",
                    "year"=>2000
                }
            ])
        end

        it 'retornar erro quando parametro estiver faltando' do
            get '/api/v1/filtro_lancamento', params: {  }

            expect(response).to have_http_status(:unprocessable_entity)
            expect(JSON.parse(response.body)).to eq({
                "error" => "param is missing or the value is empty: year\nDid you mean?  action\n               controller"
            })
        end
    end

    describe 'GET /filtro_categoria' do
        before do
            get '/api/v1/povoar_banco'
        end

        it 'buscando filme pela categoria' do
            get '/api/v1/filtro_categoria', params: { genrer: "TV Show" }

            expect(response).to have_http_status(:ok)
            expect(JSON.parse(response.body).size).to eq(25)
        end

        it 'retornar erro quando parametro estiver faltando' do
            get '/api/v1/filtro_categoria', params: {  }

            expect(response).to have_http_status(:unprocessable_entity)
            expect(JSON.parse(response.body)).to eq({
                "error" => "param is missing or the value is empty: genrer\nDid you mean?  controller\n               action",
            })
        end
    end

    describe 'GET /filtro_country' do
        before do
            get '/api/v1/povoar_banco'
        end
    
        it 'buscando filme pelo país' do
            get '/api/v1/filtro_country', params: { country: "Egypt" }

            expect(response).to have_http_status(:ok)
            expect(JSON.parse(response.body)).to eq([
                {
                    "country"=>"Egypt",
                    "description"=>
                    "With the help of his friends, a man breaks out of prison in hopes of restoring a lively nightclub.",
                    "genre"=>"Movie",
                    "id"=>38,
                    "published_at"=>"2019-04-18",
                    "title"=>"30 Days of Luxury",
                    "year"=>2016
                }
            ])
        end

        it 'retornar erro quando parametro estiver faltando' do
            get '/api/v1/filtro_country', params: {  }

            expect(response).to have_http_status(:unprocessable_entity)
            expect(JSON.parse(response.body)).to eq({
                "error" => "param is missing or the value is empty: country\nDid you mean?  controller\n               action",
            })
        end

    end

    describe 'GET filtro_title' do
        before do
            get '/api/v1/povoar_banco'
        end

        it 'buscando filme pelo titulo' do
            get '/api/v1/filtro_title', params: { title: '13 Sins'}

            expect(response).to have_http_status(:ok)
            expect(JSON.parse(response.body)).to eq({
                "country"=>"United States", 
                "description"=>"A man agrees to appear on a game show with a $6 million prize. But as the challenges become more extreme, he realizes he's made a grave mistake.", 
                "genre"=>"Movie", 
                "id"=>2, 
                "published_at"=>"2019-01-13", 
                "title"=>"13 Sins", 
                "year"=>2014
            })
        end
        
    end
end