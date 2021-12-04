Rails.application.routes.draw do
  namespace :api, defaults: {formta: :json} do
    resources :filmes
    get 'filtrarAno', to: 'filmes#filtrarAno'
    get 'filtrarCategoria' => 'filmes#filtrarCategoria'
    get 'filtrarPais' => 'filmes#filtrarPais'
  end
end
