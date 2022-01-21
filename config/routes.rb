Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :filmes
      get 'filtro_lancamento', to: 'filmes#filtro_lancamento'
      get 'filtro_categoria' => 'filmes#filtro_categoria'
      get 'filtro_country/country=:country' => 'filmes#filtro_country'
      get 'filtro_lancamento_genero/year=:year&genrer=:genrer' => 'filmes#filtro_lancamento_genero'
      get 'filmes' => 'filmes#index'
      get 'povoar_banco', to: 'filmes#povoar_banco'
    end
  end
end
