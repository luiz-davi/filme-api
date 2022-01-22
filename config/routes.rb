Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :filmes
      get 'filtro_lancamento', to: 'filmes#filtro_lancamento'
      get 'filtro_categoria' => 'filmes#filtro_categoria'
      get 'filtro_country' => 'filmes#filtro_country'
      get 'filtro_title' => 'filmes#filtro_title'
      get 'filmes' => 'filmes#index'
      get 'povoar_banco', to: 'filmes#povoar_banco'
    end
  end
end
