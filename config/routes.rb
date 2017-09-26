Rails.application.routes.draw do
  root to: 'recipes#index'

  resources :recipes do
    resources :ingredients
    resources :steps
  end

end
